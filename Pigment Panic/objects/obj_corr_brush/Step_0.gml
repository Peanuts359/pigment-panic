y += 0.02 * del_y * global.time_mult * speed_mult 
x += 0.02 * del_x * global.time_mult * speed_mult
if hit == false && ((target == noone) || ((abs(x - target_x) < 12) && (abs(y - target_y) < 12))) {
	del_x = 0
	del_y = 0
	hit = true
	if target != noone {
		instance_destroy(target)	
	}
	alarm[0] = 30
}