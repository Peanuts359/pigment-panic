/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 23F4A480
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)/// fires when any async dialog closes$(13_10)if (async_load[? "id"] == dlg_id) {$(13_10)    dlg_id = -1;          // optional: clear$(13_10)    room_goto(rm_start);  // asset, not string$(13_10)}"
/// @description Execute Code
/// fires when any async dialog closes
if (async_load[? "id"] == dlg_id) {
    dlg_id = -1;          // optional: clear
    room_goto(rm_start);  // asset, not string
}