_width = sprite_get_width(sprite_index);
_height = sprite_get_height(sprite_index);
sq_radius = power(max(_width, _height), 2) / 4
combo_colors = [c_teal, c_green, c_yellow, c_orange, c_red]
intensity_mult = [0.3, 0.4, 0.5, 0.6, 0.7]

function compute_radial_intensity(_x, _y) {
	return max(0, (power(abs(_x - _width / 2), 2) + power(abs(_y - _height / 2), 2)) / sq_radius)	
}