sand_timer -= 1 * global.time_mult
if (sand_timer <= 0) {
	var random_tile = instance_find(obj_tile_new, irandom(instance_number(obj_tile_new) - 1));

	while (random_tile.x > global.max_sand_spawn[0] or random_tile.y > global.max_sand_spawn[1]) {
		random_tile = instance_find(obj_tile_new, irandom(instance_number(obj_tile_new) - 1));	
	}

	var sand = instance_create_layer(random_tile.x, random_tile.y, "Drops", obj_sandp_spawnwrapper, 
		{image_xscale: random_tile.image_xscale,
		 image_yscale: random_tile.image_yscale}
	)
	sand_timer = 1200	
}