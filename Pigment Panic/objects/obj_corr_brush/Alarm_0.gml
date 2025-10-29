target_tile = instance_find(obj_tile_new, irandom(instance_number(obj_tile_new) - 1))
if (target_tile != noone) {
	del_x = target_tile.x - x
	del_y = target_tile.y - y
}