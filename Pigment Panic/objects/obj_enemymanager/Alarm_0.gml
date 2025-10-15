var random_tile = instance_find(obj_tile_new, irandom(instance_number(obj_tile_new) - 1));

while (random_tile.x > global.max_sand_spawn[0] or random_tile.y > global.max_sand_spawn[1]) {
	random_tile = instance_find(obj_tile_new, irandom(instance_number(obj_tile_new) - 1));	
}

instance_create_layer(random_tile.x, random_tile.y, "Instances_drops", obj_sandpaper)
alarm[0] = 1200