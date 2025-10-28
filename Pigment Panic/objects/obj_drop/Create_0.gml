/// @description Execute Code
self.image_speed = 0;
self.image_index = global.drop_colors[
	irandom(array_length(global.drop_colors) - 1)
];
drop_color = self.image_index;

self.lifetime = global.drop_life;
self.lifetime_max  = self.lifetime;

// start size
image_xscale = 1;
image_yscale = 1;