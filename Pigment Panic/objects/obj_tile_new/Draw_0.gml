// Draw fill (if any)
if color_index != Color.NONE {
	draw_self()
	draw_sprite_ext(spr_fill, 0, x, y, image_xscale, image_yscale, 0, make_colour_rgb(
		global.Color_rgb[color_index][0], 
		global.Color_rgb[color_index][1], 
		global.Color_rgb[color_index][2]),1)
}

// Draw border
draw_sprite_ext(spr_tileframe, 0, x, y, image_xscale, image_yscale, 0, make_colour_rgb(
		global.Color_rgb[desired_color][0], 
		global.Color_rgb[desired_color][1], 
		global.Color_rgb[desired_color][2]),1)
		
if tile_health > 1 {
	draw_sprite_ext(spr_tileshield, 0, x, y, image_xscale, image_yscale, 0, make_colour_rgb(
		global.Color_rgb[4][0], 
		global.Color_rgb[4][1], 
		global.Color_rgb[4][2]),1)	
}