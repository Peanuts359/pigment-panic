function scr_update_brush_color(color, x_pos, y_pos) 
{
	if color != -1 and current_brush < 3 {
		draw_sprite_ext(paint_strips[current_brush], 0, x_pos, y_pos, 1, 1, 0,
						make_colour_rgb(
							global.Color_rgb[color][0], 
							global.Color_rgb[color][1], 
							global.Color_rgb[color][2]), 1)
	}
}