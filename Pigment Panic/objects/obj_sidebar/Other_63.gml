/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 461180FB
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)if (async_load[? "id"] == dlg_id) {$(13_10)    dlg_id = -1;$(13_10)$(13_10)    room_goto(rm_result);$(13_10)}"
/// @description Execute Code
if (async_load[? "id"] == dlg_id) {
    dlg_id = -1;

    room_goto(rm_result);
}