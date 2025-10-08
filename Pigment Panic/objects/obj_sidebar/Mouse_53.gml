/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 54A39C4F
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// obj_input : Global Left Pressed$(13_10)var mx = mouse_x, my = mouse_y;$(13_10)$(13_10)// Drops first (they win)$(13_10)var d = collision_point(mx, my, obj_drop, false, true);$(13_10)if (d != noone) {$(13_10)    with (d) {$(13_10)        global.curr_color = drop_color;   // <-- move the hand-off here$(13_10)        instance_destroy();$(13_10)    }$(13_10)    exit;$(13_10)}$(13_10)$(13_10)// Then tiles$(13_10)var t = collision_point(mx, my, obj_tile_parent, false, true);$(13_10)if (t != noone) {$(13_10)    with (t) {$(13_10)        // if the tile is already colored, exit immediately$(13_10)		if (image_index == 1) exit;$(13_10)		$(13_10)		// must be holding a color$(13_10)        if (global.curr_color == Color.NONE) exit;$(13_10)$(13_10)        // tile only accepts its own required color$(13_10)        if (color_index != global.curr_color) {$(13_10)			global.score -= 100;$(13_10)			global.time_left -= 5;$(13_10)			exit;$(13_10)		}$(13_10)$(13_10)        image_index   = 1;          // mark tile filled (adjust if your filled frame differs)$(13_10)        global.score += 50;         // award points$(13_10)        global.curr_color = Color.NONE;         // consume the held color after a successful paint$(13_10)    }$(13_10)}"
/// @description Execute Code
// obj_input : Global Left Pressed
var mx = mouse_x, my = mouse_y;

// Drops first (they win)
var d = collision_point(mx, my, obj_drop, false, true);
if (d != noone) {
    with (d) {
        global.curr_color = drop_color;   // <-- move the hand-off here
        instance_destroy();
    }
    exit;
}

// Then tiles
var t = collision_point(mx, my, obj_tile_parent, false, true);
if (t != noone) {
    with (t) {
        // if the tile is already colored, exit immediately
		if (image_index == 1) exit;
		
		// must be holding a color
        if (global.curr_color == Color.NONE) exit;

        // tile only accepts its own required color
        if (color_index != global.curr_color) {
			global.score -= 100;
			global.time_left -= 5;
			exit;
		}

        image_index   = 1;          // mark tile filled (adjust if your filled frame differs)
        global.score += 50;         // award points
        global.curr_color = Color.NONE;         // consume the held color after a successful paint
    }
}