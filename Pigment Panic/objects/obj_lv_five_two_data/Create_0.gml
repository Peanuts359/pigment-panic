global.drop_colors = [0, 1, 2, 3, 3, 4]
global.level_tiles = [
       [ 1,  1, 12,  2,  6,  1, 12, 12,  2,  1],
       [ 1, 12, 11,  3,  2, 12, 11,  2,  3,  2],
       [12, 11,  0, 11,  1, 11,  0, 11,  2,  1],
       [ 1, 12, 11,  1,  2,  6, 11,  1,  3,  2],
       [12,  6, 12,  6,  3,  2,  1,  6,  2,  1],
       [ 1, 12, 12,  8,  2,  8,  8,  8,  1,  1],
       [ 1,  1, 12,  8,  8,  8,  8,  8,  1,  1],
       [ 8,  8, 22, 23, 23, 23, 23, 23,  8,  8],
       [ 8,  8, 22, 22, 23, 23, 23,  8,  8,  8],
       [ 8,  8,  8, 22, 22, 22, 22,  8,  8,  8]]
global.tiles_origin = [196, 80]
global.tiles_scale = [1.75, 1.75]
global.tiles_sep = [0, 0]
global.max_sand_spawn = [160 + 1.5 * (array_length(global.level_tiles) - 2) * 64,
						 32 + 1.5 * (array_length(global.level_tiles) - 2) * 64]
global.ref_img = spr_5_2_ref
global.spawn_pen = true
global.drop_life = 3
global.curr_sand_path = 1
instance_destroy()