/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7E094348
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// --- TIMER ---$(13_10)if (!timer_fired && !completed) {$(13_10)	drop_time -= delta_time / 1_000_000;$(13_10)	if (drop_time <= 0 && !completed) {$(13_10)		drop_time = 2$(13_10)		var xx = irandom(room_width - 320 - 32);$(13_10)		var yy = irandom(room_height - 32);$(13_10)		instance_create_layer(xx, yy, "Instances_drops", obj_drop);$(13_10)	}$(13_10)    global.time_left -= delta_time / 1_000_000; // in seconds$(13_10)    if (global.time_left <= 0) {$(13_10)		global.time_left = 0;$(13_10)        timer_fired = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Time’s Up!\nTiles Filled: " + string_format(global.tiles_cleared, 0, 2) + "%\n"$(13_10)          + "Mistakes: " + string(global.mistakes)$(13_10)        );$(13_10)    }$(13_10)}$(13_10)$(13_10)// --- TILE CHECK ---$(13_10)if (!completed) {$(13_10)    global.filled_tiles = 0;$(13_10)$(13_10)    // Count filled tiles (image_index == 1 means filled)$(13_10)    with (obj_tile_new) {$(13_10)        if (desired_color = color_index and tile_health > 0) {$(13_10)            global.filled_tiles++;$(13_10)        }$(13_10)    }$(13_10)$(13_10)    // Update percentage (store as number; format when drawing/printing)$(13_10)    if (global.total_tiles > 0) {$(13_10)        global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;$(13_10)    } else {$(13_10)        global.tiles_cleared = 0;$(13_10)    }$(13_10)$(13_10)    // Completion when 100% filled$(13_10)    if (global.filled_tiles >= global.total_tiles && global.total_tiles > 0) {$(13_10)        completed = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Level Complete!\n"$(13_10)          + "Mistakes: " + string(global.mistakes)$(13_10)        );$(13_10)    }$(13_10)}"
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// --- TIMER ---$(13_10)if (!timer_fired && !completed) {$(13_10)	drop_time -= delta_time / 1_000_000;$(13_10)	if (drop_time <= 0 && !completed) {$(13_10)		drop_time = 2$(13_10)		var xx = irandom(room_width - 320 - 32);$(13_10)		var yy = irandom(room_height - 32);$(13_10)		instance_create_layer(xx, yy, "Instances_drops", obj_drop);$(13_10)	}$(13_10)    global.time_left -= delta_time / 1_000_000; // in seconds$(13_10)    if (global.time_left <= 0) {$(13_10)		global.time_left = 0;$(13_10)        timer_fired = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Time’s Up!"$(13_10)        );$(13_10)    }$(13_10)}$(13_10)$(13_10)// --- TILE CHECK ---$(13_10)if (!completed) {$(13_10)    global.filled_tiles = 0;$(13_10)$(13_10)    // Count filled tiles (image_index == 1 means filled)$(13_10)    with (obj_tile_new) {$(13_10)        if (desired_color = color_index) {$(13_10)            global.filled_tiles++;$(13_10)        }$(13_10)    }$(13_10)$(13_10)    // Update percentage (store as number; format when drawing/printing)$(13_10)    if (global.total_tiles > 0) {$(13_10)        global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;$(13_10)    } else {$(13_10)        global.tiles_cleared = 0;$(13_10)    }$(13_10)$(13_10)    // Completion when 100% filled$(13_10)    if (global.filled_tiles >= global.total_tiles && global.total_tiles > 0) {$(13_10)        completed = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Level Complete!"$(13_10)        );$(13_10)    }$(13_10)}"
/// @description Execute Code
// --- TIMER ---
if global.paused exit;
if global.tutorial_active exit;

if (!timer_fired && !completed) {

    // tick the spawn timer
    drop_time -= delta_time / 1_000_000 * global.time_mult;

    if (drop_time <= 0 && !completed) {

        // --- SPAWN LOGIC SCALED BY COMBO STREAK ---

        // how intense the streak is, clamped to [0..1]
        // combo_count 0  -> 0.0 (calm)
        // combo_count 5+ -> 1.0 (max pressure)
        var combo_cap    = 5;
        var streak_level = clamp(global.combo_count / combo_cap, 0, 1);

        // spawn timing:
        // at streak_level = 0    -> spawn_interval = global.drop_interval
        // at streak_level = 1    -> spawn_interval = min_spawn
        var min_spawn = 0.5; // fastest allowed spawn in seconds (tune this!)
        var spawn_interval = global.drop_interval
                           - streak_level * (global.drop_interval - min_spawn);

        // reset drop_time using the scaled interval
        drop_time = spawn_interval;

        // actually spawn a drop somewhere valid
        var xx = irandom(room_width  - 320 - 32); // avoiding sidebar width?
        var yy = irandom(room_height - 32);
        instance_create_layer(xx, yy, "Drops", obj_drop);
    }

    // --- LEVEL TIMER ---
    if (global.timer_active) {
        global.time_left -= delta_time / 1_000_000 * global.time_mult; // seconds
    }

    // ran out of time?
    if (global.time_left <= 0) {
        global.time_left = 0;
        timer_fired = true;
        dlg_id = show_message_async("Time’s Up!");
    }
}


// --- TILE CHECK ---
if (!completed) {
    global.filled_tiles = 0;

    // Count filled tiles (image_index == 1 means filled)
    with (obj_tile_new) {
        if (desired_color = color_index and tile_health > 0) {
            global.filled_tiles++;
        }
    }

    // Update percentage (store as number; format when drawing/printing)
    if (global.total_tiles > 0) {
        global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;
    } else {
        global.tiles_cleared = 0;
    }

    // Completion when 100% filled
    if (global.filled_tiles >= global.total_tiles && global.total_tiles > 0) {
        completed = true;
        dlg_id = show_message_async(
            "Level Complete!"
        );
    }
}

// --- COMBO DECAY ---
if (global.combo_time > 0) {
    global.combo_time -= delta_time / 1_000_000;
}

// expire combo if timer ran out
if (global.combo_time <= 0) {
    global.combo_time     = 0;
    global.combo_count    = 0;
    global.combo_time_max = combo_calc_time_max(global.combo_count); // back to 5s
}