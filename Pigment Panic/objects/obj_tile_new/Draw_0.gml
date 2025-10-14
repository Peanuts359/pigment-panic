// Draw frame
draw_self()

// Draw fill (if any)
if color_index != Color.NONE and fill_status > -1 {
	draw_sprite_ext(global.fills[fill_status], 0, x, y, 1, 1, 0, make_colour_rgb(
		global.Color_rgb[color_index][0], 
		global.Color_rgb[color_index][1], 
		global.Color_rgb[color_index][2]),1)
}

// Draw color symbol
draw_sprite(spr_color_alphabet, 2 * desired_color, x, y)