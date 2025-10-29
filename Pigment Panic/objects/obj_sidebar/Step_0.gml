/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7E094348
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// --- TIMER ---$(13_10)if (!timer_fired && !completed) {$(13_10)	drop_time -= delta_time / 1_000_000;$(13_10)	if (drop_time <= 0 && !completed) {$(13_10)		drop_time = 2$(13_10)		var xx = irandom(room_width - 320 - 32);$(13_10)		var yy = irandom(room_height - 32);$(13_10)		instance_create_layer(xx, yy, "Instances_drops", obj_drop);$(13_10)	}$(13_10)    global.time_left -= delta_time / 1_000_000; // in seconds$(13_10)    if (global.time_left <= 0) {$(13_10)		global.time_left = 0;$(13_10)        timer_fired = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Time’s Up!\nTiles Filled: " + string_format(global.tiles_cleared, 0, 2) + "%\n"$(13_10)          + "Mistakes: " + string(global.mistakes)$(13_10)        );$(13_10)    }$(13_10)}$(13_10)$(13_10)// --- TILE CHECK ---$(13_10)if (!completed) {$(13_10)    global.filled_tiles = 0;$(13_10)$(13_10)    // Count filled tiles (image_index == 1 means filled)$(13_10)    with (obj_tile_new) {$(13_10)        if (desired_color = color_index and tile_health > 0) {$(13_10)            global.filled_tiles++;$(13_10)        }$(13_10)    }$(13_10)$(13_10)    // Update percentage (store as number; format when drawing/printing)$(13_10)    if (global.total_tiles > 0) {$(13_10)        global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;$(13_10)    } else {$(13_10)        global.tiles_cleared = 0;$(13_10)    }$(13_10)$(13_10)    // Completion when 100% filled$(13_10)    if (global.filled_tiles >= global.total_tiles && global.total_tiles > 0) {$(13_10)        completed = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Level Complete!\n"$(13_10)          + "Mistakes: " + string(global.mistakes)$(13_10)        );$(13_10)    }$(13_10)}"
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// --- TIMER ---$(13_10)if (!timer_fired && !completed) {$(13_10)	drop_time -= delta_time / 1_000_000;$(13_10)	if (drop_time <= 0 && !completed) {$(13_10)		drop_time = 2$(13_10)		var xx = irandom(room_width - 320 - 32);$(13_10)		var yy = irandom(room_height - 32);$(13_10)		instance_create_layer(xx, yy, "Instances_drops", obj_drop);$(13_10)	}$(13_10)    global.time_left -= delta_time / 1_000_000; // in seconds$(13_10)    if (global.time_left <= 0) {$(13_10)		global.time_left = 0;$(13_10)        timer_fired = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Time’s Up!"$(13_10)        );$(13_10)    }$(13_10)}$(13_10)$(13_10)// --- TILE CHECK ---$(13_10)if (!completed) {$(13_10)    global.filled_tiles = 0;$(13_10)$(13_10)    // Count filled tiles (image_index == 1 means filled)$(13_10)    with (obj_tile_new) {$(13_10)        if (desired_color = color_index) {$(13_10)            global.filled_tiles++;$(13_10)        }$(13_10)    }$(13_10)$(13_10)    // Update percentage (store as number; format when drawing/printing)$(13_10)    if (global.total_tiles > 0) {$(13_10)        global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;$(13_10)    } else {$(13_10)        global.tiles_cleared = 0;$(13_10)    }$(13_10)$(13_10)    // Completion when 100% filled$(13_10)    if (global.filled_tiles >= global.total_tiles && global.total_tiles > 0) {$(13_10)        completed = true;$(13_10)        dlg_id = show_message_async($(13_10)            "Level Complete!"$(13_10)        );$(13_10)    }$(13_10)}"
/// @description Execute Code
// --- TIMER ---
if (!timer_fired && !completed) {
	drop_time -= delta_time / 1_000_000;
    if (drop_time <= 0 && !completed) {

        // COMBO: faster spawns at higher combo
        // higher combo -> smaller reset time
        // for example: base 2s → down to ~0.5s at max combo
        var min_spawn  = 0.5;
        var combo_frac = 0;
        if (global.combo_max > 0) {
            combo_frac = global.combo / global.combo_max; // 0..1
        }
        var spawn_interval = global.drop_interval - combo_frac * (global.drop_interval - min_spawn);

        // reset timer using scaled interval
        drop_time = spawn_interval;

        // actually spawn a drop
        var xx = irandom(room_width  - 320 - 32);
        var yy = irandom(room_height - 32);
        instance_create_layer(xx, yy, "Drops", obj_drop);
    }
	if (global.timer_active) {
		global.time_left -= delta_time / 1_000_000; // in seconds
	}
    if (global.time_left <= 0) {
		global.time_left = 0;
        timer_fired = true;
        dlg_id = show_message_async(
            "Time’s Up!"
        );
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
{
    // 1. advance the timer every frame
    global.combo_timer += delta_time / 1_000_000; // seconds since last paint

    // 2. work out how long we should "hold" before decay starts.
    //    We wanted ~5s grace at low combo, ~2s grace at high combo.
    //
    //    grace(combo) = lerp(5, 2, combo_frac)
    //    where combo_frac = combo / combo_max
    var combo_frac_local = 0;
    if (global.combo_max > 0) {
        combo_frac_local = global.combo / global.combo_max; // 0..1
    }

    var grace_low  = 5.0;
    var grace_high = 2.0;
    var grace_time = grace_low - combo_frac_local * (grace_low - grace_high);
    // grace_time shrinks as combo rises.

    // 3. once we've exceeded grace_time, we start draining combo
    if (global.combo_timer > grace_time) {

        // decay speed grows with combo.
        // let’s say at combo_frac_local = 0 → ~20 units/sec to get to 0 in ~5s if max=100
        // at combo_frac_local = 1 → ~50 units/sec to burn ~100 in ~2s
        var decay_min = 20; // units per second at low combo
        var decay_max = 50; // units per second at high combo
        var decay_per_sec = decay_min + combo_frac_local * (decay_max - decay_min);

        // apply decay
        var decay_amount = decay_per_sec * (delta_time / 1_000_000);
        global.combo = max(0, global.combo - decay_amount);

        // If we hit 0, we can also clamp timer so it doesn't just grow forever
        if (global.combo <= 0) {
            global.combo       = 0;
            global.combo_timer = 0; // reset timer so we "cool off"
        }
    }
}