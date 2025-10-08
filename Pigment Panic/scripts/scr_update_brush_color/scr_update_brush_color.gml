function scr_update_brush_color(color) 
{
	if color != -1 {
		draw_sprite(colors[color], 0, 12, 72)
	}
}