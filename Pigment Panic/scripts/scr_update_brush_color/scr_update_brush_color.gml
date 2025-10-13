function scr_update_brush_color(color, x_pos, y_pos) 
{
	if color != -1 and current_brush < 3 {
		draw_sprite_ext(paint_strips[current_brush], 0, x_pos, y_pos, 1, 1, 0,
						make_colour_rgb(tints[color][0], tints[color][1], tints[color][2]), 1)
	}
}