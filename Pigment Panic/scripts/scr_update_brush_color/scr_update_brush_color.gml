function scr_update_brush_color(color) 
{
	if color != -1 {
		draw_sprite_ext(spr_paint_White, 0, 12, 72, 1, 1, 0,
						make_colour_rgb(tints[color][0], tints[color][1], tints[color][2]), 1)
	}
}