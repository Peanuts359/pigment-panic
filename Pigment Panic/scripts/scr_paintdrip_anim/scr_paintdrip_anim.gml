function scr_paintdrip_anim(color) 
{
	if color != -1 and current_brush < 3 {
		var paint = instance_create_layer(mouse_x, mouse_y, "Cursor", obj_paintdrip)
		paint.sprite_index = spr_paintdrip_White
		paint.image_blend = make_colour_rgb(
			global.Color_rgb[color][0], 
			global.Color_rgb[color][1], 
			global.Color_rgb[color][2])
	}
}