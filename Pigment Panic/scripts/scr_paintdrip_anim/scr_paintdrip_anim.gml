function scr_paintdrip_anim(color) 
{
	if color != -1 {
		var paint = instance_create_layer(mouse_x, mouse_y, "Cursor", obj_paintdrip)
		paint.sprite_index = spr_paintdrip_White
		paint.image_blend = make_colour_rgb(tints[color][0], tints[color][1], tints[color][2])
	}
}