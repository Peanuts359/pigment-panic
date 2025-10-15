delta_x = 64/60
delta_y = 0
speed_mult = 1
time_before_turn = 2
remaining_turns = 3

timer = time_before_turn

prev_colliding_instance = noone;

function rotate(){
	var temp = -delta_y
	delta_y = delta_x
	delta_x = temp
	remaining_turns -= 1
}