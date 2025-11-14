delta_x = 64/60
delta_y = 0
speed_mult = 1
max_speed = 1
journey = [2, 2, 2, 2]
time_before_turn = journey[0]
remaining_turns = 3

timer = time_before_turn

prev_colliding_instance = noone;

function rotate(){
	var temp = -delta_y
	delta_y = delta_x
	delta_x = temp
	time_before_turn = journey[4 - remaining_turns]
	remaining_turns -= 1
}