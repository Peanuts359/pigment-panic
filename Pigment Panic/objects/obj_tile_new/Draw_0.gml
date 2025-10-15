// Draw frame
draw_self()

// Draw fill (if any)
if color_index != Color.NONE and fill_status > -1 {
	draw_sprite_ext(global.fills[fill_status], 0, x, y, image_xscale, image_yscale, 0, make_colour_rgb(
		global.Color_rgb[color_index][0], 
		global.Color_rgb[color_index][1], 
		global.Color_rgb[color_index][2]),1)
	
	// Draw damage if damaged
	if tile_health = 0 {
			
	}
}

// Draw color symbol
draw_sprite_ext(spr_color_alphabet, 2 * desired_color + desired_fill, x, y,
	image_xscale, image_yscale, 0, make_color_rgb(255, 255, 255), 1)