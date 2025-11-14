global.drop_colors = [0, 1, 2, 3, 3, 4]
global.level_tiles = [[ 0,  0,  1,  1,  2,  2],
					  [3, 3, 3, 4, 4, 4]]
global.tiles_origin = [96, 384]
global.tiles_scale = [3.5, 3.5]
global.tiles_sep = [0, 0]
global.max_sand_spawn = [96 + 3.5 * (array_length(global.level_tiles) - 2) * 64,
						 384 + 3.5 * (array_length(global.level_tiles) - 2) * 64]
global.ref_img = noone
global.spawn_pen = true
global.drop_life = 3
global.curr_sand_path = 0
instance_destroy()