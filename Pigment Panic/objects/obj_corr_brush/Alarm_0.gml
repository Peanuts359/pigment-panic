target = instance_find(obj_drop, irandom(instance_number(obj_drop) - 1))
hit = false
if (target != noone) {
	del_x = target.x - x
	del_y = target.y - y
	target_x = target.x
	target_y = target.y
	
} else {
	alarm[0] = 10	
}