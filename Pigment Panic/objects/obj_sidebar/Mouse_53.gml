/// @description Execute Code
// obj_input : Global Left Pressed
var mx = mouse_x, my = mouse_y;
var brush_type = brush.current_brush

// Drops first (they win)
var d = collision_point(mx, my, obj_drop, false, true);
// If using the knife, then skip this block of code
if (d != noone) and brush_type < 3 {
    with (d) {
        var success = brush_push(drop_color);
        if success instance_destroy();
    }
    exit;
}

// Then tiles
// TODO: Include separate logic for knife
var t = collision_point(mx, my, obj_tile_new, false, true);

if (t != noone) {
	var top_color = brush_top();
    with (t) {
		

        // if tile already colored and healthy, skip
        if (fill_status != -1 && tile_health > 0) exit;

        // must be holding at least one color
        if (top_color == Color.NONE) exit;

        // color must match this tile's required color
        if (desired_color != top_color) {
            global.mistakes += 1;
            audio_play_sound(snd_mistake, 0, false);

            if (global.timer_active) {
                global.time_left = max(0, global.time_left - 5);
            }

            exit;
        }
        // correct color → paint once
		// we set an alarm to delay the painting of the tile if needed
		if (brush_type == 1) {
			alarm[0] = 30
			tile_health = 2
		} else {
			alarm[0] = 1
			tile_health = 1
		}

        // increment level counters (the sidebar is `other` here)
        global.filled_tiles += 1;
		
		// If using the fan brush, calculate if we need to paint
		// adjacent tiles
        if (brush_type == 2) {
            for (var i = -1; i <= 1; i++) {

                var u = collision_point(
                    x + (i * sprite_width),
                    y - sprite_height,
                    obj_tile_new,
                    false,
                    true
                );

                if (u != noone) {

                    // skip if already painted + healthy
                    if (!(u.fill_status != -1 && u.tile_health > 0)) {

                        // must match same color as our top_color
                        if (u.desired_color == top_color) {
                            u.alarm[0]    = 1;
                            u.tile_health = 1;
                            global.filled_tiles += 1;
                        }
                    }
                }
            }
        }

        // recompute percentage to 2dp
        if (global.total_tiles > 0) {
            global.tiles_cleared =
                (global.filled_tiles / global.total_tiles) * 100;
        }

        // spend the paint we just used
        brush_pop_top();
    }
}