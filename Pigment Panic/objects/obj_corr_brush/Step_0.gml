y += 0.02 * del_y * global.time_mult * speed_mult 
x += 0.02 * del_x * global.time_mult * speed_mult
if hit == false && ((target == noone) || ((abs(x - target_x) < 12) && (abs(y - target_y) < 12))) {
	del_x = 0
	del_y = 0
	hit = true
	if target != noone {
		if array_length(stolen_paints) < 5 {
			array_push(stolen_paints, target.drop_color)
		}
		if array_length(stolen_paints) == 5 {
			sprite_index = spr_corrbrush_2
		}
		instance_destroy(target)	
	}
	alarm[0] = 30
}