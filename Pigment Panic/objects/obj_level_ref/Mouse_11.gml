if img_instance != noone {
	instance_destroy(img_instance)
	img_instance = noone
	game_set_speed(60, gamespeed_fps)
}