
img_instance = instance_create_layer((room_width - sprite_get_width(global.ref_img)) / 2, 
	(room_height - sprite_get_height(global.ref_img)) / 2, "Cursor", obj_lore_img)
img_instance.sprite_index = spr_pop_up_lore