global.total_tiles = 0;
global.filled_tiles = 0;
global.tiles_cleared = 0; 

with (obj_tile_parent) {
    global.total_tiles++;
    if (image_index == 1) global.filled_tiles++; // if any start filled
}
if (global.total_tiles == 0) global.tiles_cleared = 0;
else global.tiles_cleared = (global.filled_tiles / global.total_tiles) * 100;