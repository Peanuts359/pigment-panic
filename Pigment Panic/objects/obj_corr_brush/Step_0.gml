y += 0.02 * del_y * global.time_mult
x += 0.02 * del_x * global.time_mult
if hit == false && (abs(x - target_x) < 0.1) && (abs(y - target_y) < 0.1) {
	del_x = 0
	del_y = 0
	hit = true
	if target != noone {
		instance_destroy(target)	
	}
	alarm[0] = 30
}