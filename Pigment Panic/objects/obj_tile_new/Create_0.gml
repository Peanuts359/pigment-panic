color_index = Color.NONE;

fill_status = -1;
tile_health = 0;

colliding = false;

function damage() {
	if color_index != Color.NONE and tile_health > 0 {
		tile_health -= 1
		if tile_health == 0 {
			color_index = Color.NONE
		}
	}
}