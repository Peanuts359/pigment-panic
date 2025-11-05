var d_id = ds_map_find_value(async_load, "id");
if (d_id == global.forfeit_dialog) {
	global.paused = false;
	global.input_lock = false;
	global.time_mult = 1;
     global.forfeit_dialog = -1;
     room_goto(rm_result);
}