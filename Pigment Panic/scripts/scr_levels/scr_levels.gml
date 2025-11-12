enum Gimmick {
	MONOCHROME = 0,
	PRIMARY = 1,
	TWOMIX = 2,
	THREEMIX = 3,
	SHADE = 4,
	FAN = 5,
	SANDPAPER = 6,
	CBRUSH = 7
}

enum Level {
    ONE_ONE,      // Tier 1-1
    ONE_TWO,      // Tier 1-2
    ONE_THREE,    // Tier 1-3
    TWO_ONE,      // Tier 2-1
    TWO_TWO,      // Tier 2-2
    TWO_THREE,    // Tier 2-3
    THREE_ONE,    // Tier 3-1
    THREE_TWO,    // Tier 3-2
    THREE_THREE,  // Tier 3-3
    FOUR_ONE,     // Tier 4-1
    FIVE_ONE,     // Tier 5-1 (boss tutorial)
    FIVE_TWO      // Tier 5-2 (boss level)
}

function levels_init() {
	if (variable_global_exists("Levels")) return;

	var LEVEL_COUNT = Level.FIVE_TWO + 1;
	global.Levels = array_create(LEVEL_COUNT, undefined);

    // Helper macro: packs a level definition
    var _def = function(_room, _data_obj, _gimmicks_array, _order) {
        return {
            room      : _room,
            data_obj  : _data_obj,
            gimmicks  : _gimmicks_array,  // allow multiple if a level introduces more than one
            order     : _order            // linear progression index (0,1,2,...)
        };
    };

    // -------- Tier 1 (rooms: rm_lv_one) --------
    global.Levels[Level.ONE_ONE]    = _def(rm_lv_base,      obj_lv_one_one_data,   [Gimmick.MONOCHROME], 0);
    global.Levels[Level.ONE_TWO]    = _def(rm_lv_base,      obj_lv_one_two_data,   [Gimmick.PRIMARY],    1);
    global.Levels[Level.ONE_THREE]  = _def(rm_lv_base,      obj_lv_one_three_data, [Gimmick.PRIMARY],    2);

    // -------- Tier 2 (rooms: rm_lv_two_mix) --------
    global.Levels[Level.TWO_ONE]    = _def(rm_lv_two_mix,  obj_lv_two_one_data,   [Gimmick.TWOMIX],     3);
    global.Levels[Level.TWO_TWO]    = _def(rm_lv_two_mix,  obj_lv_two_two_data,   [Gimmick.THREEMIX],   4);
    global.Levels[Level.TWO_THREE]  = _def(rm_lv_two_mix,  obj_lv_two_three_data, [Gimmick.THREEMIX],   5);

    // -------- Tier 3 (rooms: rm_lv_three_mix) --------
    // Level 3-1 teaches shading; 3-2 introduces Fan; 3-3 is still shading
    global.Levels[Level.THREE_ONE]   = _def(rm_lv_three_mix, obj_lv_three_one_data,   [Gimmick.SHADE],    6);
    global.Levels[Level.THREE_TWO]   = _def(rm_lv_three_mix, obj_lv_three_two_data,   [Gimmick.FAN],      7);
    global.Levels[Level.THREE_THREE] = _def(rm_lv_three_mix, obj_lv_three_three_data, [Gimmick.SHADE],    8);

    // -------- Tier 4 (rooms: rm_lv_four) --------
    // This tier brings Sandpaper
    global.Levels[Level.FOUR_ONE]   = _def(rm_lv_four,  obj_lv_four_one_data,  [Gimmick.SANDPAPER], 9);

    // -------- Tier 5 (rooms: rm_lv_five) --------
    global.Levels[Level.FIVE_ONE]   = _def(rm_lv_five,  obj_lv_five_one_data,  [Gimmick.CBRUSH],   10); // boss tutorial
    global.Levels[Level.FIVE_TWO]   = _def(rm_lv_five,  obj_lv_five_two_data,  [Gimmick.CBRUSH],   11); // boss level
}

// ------------------------------------------------------------
// Small helpers
// ------------------------------------------------------------
function level_get_def(lv) {
    return global.Levels[lv];
}

function section_from_level(lv) {
    var section = (lv div 3) + 1;   // 0..2→1, 3..5→2, 6..8→3, 9..11→4
    if (section < 4) return section; // tiers 1–3
    return (lv == 9) ? 4 : 5;        // 9→4, 10–11→5
}

// Maximum/newest gimmick a level introduces (so buttons can warn about “out of sequence”)
function level_get_newest_gimmick(lv) {
    var gs = global.Levels[lv].gimmicks;
    var mx = -1;
    for (var i = 0; i < array_length(gs); i++) mx = max(mx, gs[i]);
    return mx;
}


function level_start(lv) {
    var def = level_get_def(lv);

    // ensure the level's data object exists
    instance_create_layer(0, 0, "Instances", def.data_obj);

    // room/session flags
    global.last_visited_level = section_from_level(lv);
    global.playing            = true;
    global.timer_active       = false;

    // progression update
    var g = level_get_newest_gimmick(lv);
    global.last_gimmick = max(global.last_gimmick, g);
    global.next_gimmick = min(Gimmick.CBRUSH, global.last_gimmick + 1);

    room_goto(def.room);
}

function controller_get() {
    var ctrl = instance_find(obj_lv_controller, 0);
    return instance_exists(ctrl) ? ctrl : noone;
}

function request_start_level(lv)
{
    var ctrl = controller_get();
    if (ctrl == noone) { 
        // no controller? just start
        level_start(lv);
        return;
    }

    // If a dialog is already up, ignore
    if (ctrl.dlg_id != -1) return;

    var new_g = level_get_newest_gimmick(lv);

    // Gate: warn if jumping ahead of planned sequence
    if (new_g > global.next_gimmick) {
        var msg = 
            "This level introduces a mechanic we do not plan to introduce yet.\n" +
            "We recommend playing the levels in numerical order.\n\n" +
            "Play this level anyway?";
        ctrl.dlg_id        = show_question_async(msg);  // stores the async id on the controller
        ctrl.pending_level = lv;
        return;
    }

    // Otherwise start immediately
    level_start(lv);
}
