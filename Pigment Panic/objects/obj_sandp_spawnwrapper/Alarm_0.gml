var sand = instance_create_layer(x, y, "Drops", obj_sandpaper, 
	{image_xscale: image_xscale,
	 image_yscale: image_yscale}
)
sand.max_speed = image_xscale
instance_destroy()