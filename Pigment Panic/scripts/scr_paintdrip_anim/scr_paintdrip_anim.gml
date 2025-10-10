function scr_paintdrip_anim(color) 
{
	show_debug_message(string(color))
	if color != -1 {
		var paint = instance_create_layer(mouse_x, mouse_y, "Cursor", obj_paintdrip)
		paint.sprite_index = drip[color]
	}
	show_debug_message("Got Drip")
}