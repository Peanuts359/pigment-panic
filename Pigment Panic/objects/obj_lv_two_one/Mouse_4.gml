/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 08BE9767
/// @DnDArgument : "objectid" "obj_lv_two_one_data"
/// @DnDSaveInfo : "objectid" "obj_lv_two_one_data"
instance_create_layer(0, 0, "Instances", obj_lv_two_one_data);

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 05036AAF
/// @DnDArgument : "value" "1"
/// @DnDArgument : "var" "last_visited_level"
global.last_visited_level = 1;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 42C194DE
/// @DnDArgument : "value" "false"
/// @DnDArgument : "var" "timer_active"
global.timer_active = false;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 375C83EF
/// @DnDArgument : "value" "4"
/// @DnDArgument : "var" "drop_life"
global.drop_life = 4;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 41A4FA5D
/// @DnDArgument : "value" "true"
/// @DnDArgument : "var" "playing"
global.playing = true;

/// @DnDAction : YoYo Games.Rooms.Go_To_Room
/// @DnDVersion : 1
/// @DnDHash : 5C62CDB1
/// @DnDArgument : "room" "rm_lv_two_mix"
/// @DnDSaveInfo : "room" "rm_lv_two_mix"
room_goto(rm_lv_two_mix);