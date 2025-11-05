global.time_left = level_time;
global.mistakes = 0;
global.total_tiles = 0;
global.filled_tiles = 0;
global.tiles_cleared = 0; 

dlg_id = -1;

timer_fired = false;

completed = false;

global.drop_interval = drop_interval;
drop_time = global.drop_interval;

// Store a reference to the brush object
brush = instance_nearest(x, y, obj_brush)

alarm[0] = 1