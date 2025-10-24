var d_id = ds_map_find_value(async_load, "id");
if (d_id == global.forfeit_dialog) {
     global.forfeit_dialog = -1;
     room_goto(rm_result);
}