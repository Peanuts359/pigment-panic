color_table_init(); 
global.last_visited_level = -1;
global.continuing = false;

global.combo_count    = 0;
global.combo_time_max = combo_calc_time_max(global.combo_count); // will return 5
global.combo_time     = 0; // 0 until first correct paint

global.playing = false;
global.paused     = false;
global.input_lock = false;

global.constituents = [[0], [1], [2], [3], [4], [0, 1], [1, 2], [0, 2], [0, 1, 2], [3, 4],
	[0, 3], [0, 4], [1, 3], [1, 4], [2, 3], [2, 4], [0, 1, 3], [0, 1, 4], [0, 2, 3], [0, 2, 4],
	[1, 2, 3], [1, 2, 4], [0, 1, 2, 3], [0, 1, 2, 4], [3, 3, 4], [3, 4, 4]]
	
global.paths = [[5, 1, 5, 1], [7, 7, 7, 7]]
global.arrow_path_spr = [spr_path_dash_one, spr_path_dash_two]
global.sand_spawn_loc = [[96, 384], [196 + 112, 80 + 112]]
global.sand_spawn_scale = [3.5, 1.75]