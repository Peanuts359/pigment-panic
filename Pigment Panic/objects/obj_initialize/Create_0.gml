color_table_init(); 
global.last_visited_level = -1;

show_debug_message("[TEST] Y+B = " + string(mix2(Color.YELLOW, Color.BLUE))); // expect GREEN
show_debug_message("[TEST] Y+B+W = " + string(mix3(Color.YELLOW, Color.BLUE, Color.WHITE))); // expect L_GREEN
show_debug_message("[TEST] R+B+Y = " + string(mix3(Color.RED, Color.BLUE, Color.YELLOW))); // expect BROWN