/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 54A39C4F
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// obj_input : Global Left Pressed$(13_10)var mx = mouse_x, my = mouse_y;$(13_10)var brush_type = brush.current_brush$(13_10)var brush_fill = brush.watercolor_status$(13_10)$(13_10)// Drops first (they win)$(13_10)var d = collision_point(mx, my, obj_drop, false, true);$(13_10)// If using the knife, then skip this block of code$(13_10)if (d != noone) and brush_type < 3 {$(13_10)    with (d) {$(13_10)        global.curr_color = drop_color;   // <-- move the hand-off here$(13_10)        instance_destroy();$(13_10)    }$(13_10)	// reset watercolor status when picking up a new paint drop$(13_10)	brush.watercolor_status = 0$(13_10)    exit;$(13_10)}$(13_10)$(13_10)// Then tiles$(13_10)// TODO: Include separate logic for knife$(13_10)var t = collision_point(mx, my, obj_tile_new, false, true);$(13_10)$(13_10)if (t != noone) {$(13_10)    with (t) {$(13_10)        // if the tile is already colored, exit immediately$(13_10)		if (fill_status != -1) exit;$(13_10)		$(13_10)		// must be holding a color$(13_10)        if (global.curr_color == Color.NONE) exit;$(13_10)$(13_10)        // tile only accepts its own required color$(13_10)        if (desired_color != global.curr_color) $(13_10)			or (desired_fill != brush_fill) {$(13_10)            global.mistakes += 1;$(13_10)            global.time_left = max(0, global.time_left - 5);$(13_10)            exit;$(13_10)        }$(13_10)$(13_10)        // correct color → paint once$(13_10)		// we set an alarm to delay the painting of the tile if needed$(13_10)		if (brush_type == 1) {$(13_10)			alarm[brush_fill] = 30$(13_10)		} else {$(13_10)			alarm[brush_fill] = 1	$(13_10)		}$(13_10)$(13_10)        // increment level counters (the sidebar is `other` here)$(13_10)        global.filled_tiles += 1;$(13_10)		$(13_10)		// If using the fan brush, calculate if we need to paint$(13_10)		// adjacent tiles$(13_10)		if brush_type == 2 {$(13_10)			for (var i = -1; i <= 1; i++) {$(13_10)				var u = collision_point($(13_10)					mx + (i * sprite_width), my - sprite_height, $(13_10)					obj_tile_new, false, true$(13_10)				);$(13_10)				if ($(13_10)					u != noone $(13_10)					and u.fill_status == -1 $(13_10)					and u.desired_color == global.curr_color$(13_10)					and u.desired_fill == brush_fill$(13_10)				) {$(13_10)					u.alarm[brush_fill] = 1$(13_10)					global.filled_tiles += 1$(13_10)				}$(13_10)			}$(13_10)		}$(13_10)$(13_10)        // recompute percentage to 2dp$(13_10)        if (global.total_tiles > 0) {$(13_10)            global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;$(13_10)            // keep as a number; format to 2dp only when drawing:$(13_10)            // string_format(global.tiles_cleared, 0, 2)$(13_10)        }$(13_10)$(13_10)        // consume held color$(13_10)        global.curr_color = Color.NONE;$(13_10)    }$(13_10)}"
/// @description Execute Code
// obj_input : Global Left Pressed
var mx = mouse_x, my = mouse_y;
var brush_type = brush.current_brush
var brush_fill = brush.watercolor_status

// Drops first (they win)
var d = collision_point(mx, my, obj_drop, false, true);
// If using the knife, then skip this block of code
if (d != noone) and brush_type < 3 {
    with (d) {
        global.curr_color = drop_color;   // <-- move the hand-off here
        instance_destroy();
    }
	// reset watercolor status when picking up a new paint drop
	brush.watercolor_status = 0
    exit;
}

// Then tiles
// TODO: Include separate logic for knife
var t = collision_point(mx, my, obj_tile_new, false, true);

if (t != noone) {
    with (t) {
        // if the tile is already colored, exit immediately
		if (fill_status != -1) exit;
		
		// must be holding a color
        if (global.curr_color == Color.NONE) exit;

        // tile only accepts its own required color
        if (desired_color != global.curr_color) 
			or (desired_fill != brush_fill) {
            global.mistakes += 1;
            global.time_left = max(0, global.time_left - 5);
            exit;
        }

        // correct color → paint once
		// we set an alarm to delay the painting of the tile if needed
		if (brush_type == 1) {
			alarm[brush_fill] = 30
		} else {
			alarm[brush_fill] = 1	
		}

        // increment level counters (the sidebar is `other` here)
        global.filled_tiles += 1;
		
		// If using the fan brush, calculate if we need to paint
		// adjacent tiles
		if brush_type == 2 {
			for (var i = -1; i <= 1; i++) {
				var u = collision_point(
					mx + (i * sprite_width), my - sprite_height, 
					obj_tile_new, false, true
				);
				if (
					u != noone 
					and u.fill_status == -1 
					and u.desired_color == global.curr_color
					and u.desired_fill == brush_fill
				) {
					u.alarm[brush_fill] = 1
					global.filled_tiles += 1
				}
			}
		}

        // recompute percentage to 2dp
        if (global.total_tiles > 0) {
            global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;
            // keep as a number; format to 2dp only when drawing:
            // string_format(global.tiles_cleared, 0, 2)
        }

        // consume held color
        global.curr_color = Color.NONE;
    }
}