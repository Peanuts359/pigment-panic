delta_x = 64/60
delta_y = 0
speed_mult = 1
time_before_turn = 120
alarm[0] = time_before_turn

function rotate(){
	var temp = -delta_y
	delta_y = delta_x
	delta_x = temp
}