/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 60129BB0
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)if (!timer_fired) {$(13_10)    time_left -= delta_time;$(13_10)    if (time_left <= 0) {$(13_10)        timer_fired = true;                 // set before opening dialog$(13_10)        dlg_id = show_message_async("Time's up!");$(13_10)    }$(13_10)}"
/// @description Execute Code
if (!timer_fired) {
    time_left -= delta_time;
    if (time_left <= 0) {
        timer_fired = true;                 // set before opening dialog
        dlg_id = show_message_async("Time's up!");
    }
}