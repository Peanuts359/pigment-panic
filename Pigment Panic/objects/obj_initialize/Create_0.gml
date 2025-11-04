color_table_init(); 
global.last_visited_level = -1;
global.continuing = false;

global.combo_count    = 0;
global.combo_time_max = combo_calc_time_max(global.combo_count); // will return 5
global.combo_time     = 0; // 0 until first correct paint

global.playing = false;
global.paused     = false;
global.input_lock = false;