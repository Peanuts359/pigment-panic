/// obj_drop : Create
image_speed  = 0;
image_index  = global.drop_colors[ irandom(array_length(global.drop_colors) - 1) ];
drop_color   = image_index;

self.lifetime     = global.drop_life;
self.lifetime_max = self.lifetime;

// visual tunables
self.max_scale       = 3;      // final size (1 → 3)
self.grow_portion    = 0.75;   // reach max at 75%
self.flicker_portion = 0.25;   // last 25% is flicker zone
self.flicker_blinks  = 3;      // how many full on/off blinks
self.alpha_on        = 1.0;    // normal alpha
self.alpha_off       = 0.2;    // dim during flicker

image_xscale = 1;
image_yscale = 1;
image_alpha  = self.alpha_on;