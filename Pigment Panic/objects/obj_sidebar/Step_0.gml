/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7E094348
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// --- TIMER ---$(13_10)if (!timer_fired) {$(13_10)    global.time_left -= delta_time / 1_000_000; // in seconds$(13_10)    if (global.time_left <= 0) {$(13_10)        timer_fired = true; // prevent repeats$(13_10)        dlg_id = show_message_async("Game Over");$(13_10)    }$(13_10)}$(13_10)$(13_10)// --- TILE CHECK ---$(13_10)if (!completed) {$(13_10)    all_colored = true;$(13_10)$(13_10)    // check every tile (parent includes all children)$(13_10)    with (obj_tile_parent) {$(13_10)        if (image_index != 1) {$(13_10)            other.all_colored = false;$(13_10)        }$(13_10)    }$(13_10)$(13_10)    if (all_colored) {$(13_10)        completed = true;       // lock it$(13_10)        global.time_left = 9999; // optional: freeze timer$(13_10)        dlg_id = show_message_async("Level Complete");$(13_10)    }$(13_10)}"
/// @description Execute Code
// --- TIMER ---
if (!timer_fired) {
    global.time_left -= delta_time / 1_000_000; // in seconds
    if (global.time_left <= 0) {
        timer_fired = true; // prevent repeats
        dlg_id = show_message_async("Game Over");
    }
}

// --- TILE CHECK ---
if (!completed) {
    all_colored = true;

    // check every tile (parent includes all children)
    with (obj_tile_parent) {
        if (image_index != 1) {
            other.all_colored = false;
        }
    }

    if (all_colored) {
        completed = true;       // lock it
        global.time_left = 9999; // optional: freeze timer
        dlg_id = show_message_async("Level Complete");
    }
}