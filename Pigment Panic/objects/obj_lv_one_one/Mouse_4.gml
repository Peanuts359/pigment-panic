/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 08BE9767
/// @DnDArgument : "objectid" "obj_lv_one_one_data"
/// @DnDSaveInfo : "objectid" "obj_lv_one_one_data"
instance_create_layer(0, 0, "Instances", obj_lv_one_one_data);

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
/// @DnDArgument : "value" "5"
/// @DnDArgument : "var" "drop_life"
global.drop_life = 5;

/// @DnDAction : YoYo Games.Rooms.Go_To_Room
/// @DnDVersion : 1
/// @DnDHash : 5C62CDB1
/// @DnDArgument : "room" "rm_lv_base"
/// @DnDSaveInfo : "room" "rm_lv_base"
room_goto(rm_lv_base);