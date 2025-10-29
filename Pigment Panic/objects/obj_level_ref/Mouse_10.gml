if variable_global_exists("ref_img") {
	if global.ref_img != noone {
		img_instance = instance_create_layer((room_width - sprite_get_width(global.ref_img)) / 2, 
			(room_height - sprite_get_height(global.ref_img)) / 2, "Cursor", obj_level_ref_img)
		img_instance.sprite_index = global.ref_img
		game_set_speed(30, gamespeed_fps)
	}
}