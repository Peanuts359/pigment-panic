brush_timer = 600
var sand = instance_create_layer(global.sand_spawn_loc[global.curr_sand_path][0], 
	global.sand_spawn_loc[global.curr_sand_path][1],
	"Instances", obj_sandp_spawnwrapper)
sand.image_xscale = global.sand_spawn_scale[global.curr_sand_path]
sand.image_yscale = global.sand_spawn_scale[global.curr_sand_path]
sand.sprite_index = global.arrow_path_spr[global.curr_sand_path]