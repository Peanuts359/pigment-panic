/// @DnDAction : YoYo Games.Rooms.Go_To_Room
/// @DnDVersion : 1
/// @DnDHash : 3F4FD2B1
/// @DnDArgument : "room" "rm_lv_one"
/// @DnDSaveInfo : "room" "rm_lv_one"
room_goto(rm_lv_one);

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 00485F6F
/// @DnDArgument : "value" "1"
/// @DnDArgument : "var" "last_visited_level"
global.last_visited_level = 1;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 2EA2A940
/// @DnDArgument : "value" "true"
/// @DnDArgument : "var" "timer_active"
global.timer_active = true;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 6DC0C013
/// @DnDArgument : "value" "5"
/// @DnDArgument : "var" "drop_life"
global.drop_life = 5;