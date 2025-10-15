x += delta_x * speed_mult
y += delta_y * speed_mult

timer -= delta_time / 1000000 * speed_mult


if timer <= 0 {
	if remaining_turns == 0 {
		instance_destroy()	
	}
	rotate()
	timer = time_before_turn
}