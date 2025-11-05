// Reset parameters from previous level
global.paused    = false;
global.time_mult = global.paused ? 0 : 1;
global.input_lock = global.paused;
global.combo_count = 0
global.combo_time = 0