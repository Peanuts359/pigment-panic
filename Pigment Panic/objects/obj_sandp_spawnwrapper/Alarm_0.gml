var sand = instance_create_layer(x, y, "Drops", obj_sandpaper, 
	{image_xscale: image_xscale,
	 image_yscale: image_yscale}
)
sand.journey = global.paths[global.curr_sand_path]
sand.timer = sand.journey[0]
show_debug_message(sand.time_before_turn)
sand.max_speed = image_xscale
image_alpha = 1
continue_to_update = false