target = instance_find(obj_drop, irandom(instance_number(obj_drop) - 1))
hit = false
if (target != noone) {
	del_x = target.x - x
	del_y = target.y - y
	// Normalize movement vector
	var magnitude = point_distance(0, 0, del_x, del_y)
	if magnitude == 0 {
		magnitude = 1	
	}
	del_x = del_x / magnitude
	del_y = del_y / magnitude
	target_x = target.x
	target_y = target.y
	
} else {
	alarm[0] = 10	
}