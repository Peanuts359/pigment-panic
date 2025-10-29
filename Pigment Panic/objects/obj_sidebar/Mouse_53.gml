/// @description Execute Code
// obj_input : Global Left Pressed
var mx = mouse_x, my = mouse_y;
var brush_type = brush.current_brush

var d = collision_point(mx, my, obj_drop, false, true);

// If we're not using the knife, allow picking up paint
if (d != noone && brush_type < 3) {
    with (d) {
        var pushed_any = false;

        // how many charges this drop gives
        var pickup_count = (image_xscale > 2.5) ? 2 : 1;

        repeat (pickup_count) {
            // attempt to push the drop's color onto the brush stack
            if (brush_push(drop_color)) {
                pushed_any = true;
            } else {
                // brush is full; stop trying
                break;
            }
        }

        // only consume the drop if we actually stored something
        if (pushed_any) {
            instance_destroy();
        }
    }

    exit;
}

// Then tiles
var t = collision_point(mx, my, obj_tile_new, false, true);
var top_color = brush_top();          // color currently at top of stack

if (t != noone) {

    // must at least be holding some color unless we're the knife
    // (knife logic will be special-cased below if you want it to work empty)
    if (brush_type != 3 && top_color == Color.NONE) {
        exit;
    }

    // We'll store some values from the target tile (t) BEFORE diving into with(),
    // so we can still access them in our outer scope:
    var tile_ok_to_paint =
        !(t.fill_status != -1 && t.tile_health > 0 && t.color_index == t.desired_color); // not already painted+healthy

    var tile_color_matches =
        (t.desired_color == top_color);              // correct color for this tile

    // If it's a "regular paint attempt" (not knife):
    if (brush_type != 3) {

        // First, check if it's already painted/healthy
        if (!tile_ok_to_paint) {
            exit;
        }

        // Now check color correctness
        if (!tile_color_matches) {
            // wrong color penalty
            global.mistakes += 1;
            audio_play_sound(snd_mistake, 0, false);

            if (global.timer_active) {
                global.time_left = max(0, global.time_left - 5);
            }

            exit;
        }

        // If we got here: we're allowed to apply paint to t

        // --- apply paint to the clicked tile ---
        // slow brush vs normal:
        if (brush_type == 1) {            // e.g. "calbrush", slower / multi-hit
            t.alarm[0]    = 30;           // delayed fill
            t.tile_health = 2;
        } else {
            t.alarm[0]    = 1;
            t.tile_health = 1;
        }

        global.filled_tiles += 1;

        // --- fan brush splash (brush_type == 2) ---
        if (brush_type == 2) {
            // We'll grab t.x/t.y first so we fan around from that location.
            var base_x = t.x;
            var base_y = t.y;

            // Check 3 positions above click: left/center/right
            for (var i = -1; i <= 1; i++) {
				for (var j = -1; j <= 0; j++) {
	                var u = collision_point(
	                    base_x + (i * t.sprite_width),
	                    base_y + (j * t.sprite_height),
	                    obj_tile_new,
	                    false,
	                    true
	                );

	                if (u != noone) {

	                    var u_ok_to_paint =
	                        !(u.fill_status != -1 && u.tile_health > 0 && u.color_index == u.desired_color);

	                    var u_color_matches =
	                        (u.desired_color == top_color);

	                    if (u_ok_to_paint && u_color_matches) {
	                        u.alarm[0]    = 1;
	                        u.tile_health = 1;
	                        global.filled_tiles += 1;
	                    }
	                }
				}
            }
        }

        // --- update cleared % ---
        if (global.total_tiles > 0) {
            global.tiles_cleared =
                (global.filled_tiles / global.total_tiles) * 100;
        }

        // --- consume one paint from the brush stack ---
        brush_pop_top();

        // --- combo gain (successful placement counts as 1 action) ---
		global.combo_count += 1;
		global.combo_time_max = combo_calc_time_max(global.combo_count);
		global.combo_time     = global.combo_time_max;

        exit;
    }

	// knife does nothing yet
    if (brush_type == 3) {
        exit;
    }
}
