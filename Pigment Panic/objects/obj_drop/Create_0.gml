image_speed  = 0;

// pick color/frame however you do it
image_index  = scr_query_for_color();
drop_color   = image_index;

// lifetime (seconds)
lifetime     = global.drop_life;
lifetime_max = lifetime;

// phase fractions
grow_portion   = 0.75;  // reach max size here
pulse_portion  = 0.20;  // warning pulse
shrink_portion = 0.05;  // rapid shrink end

// visuals
max_scale   = 3.0;
pulse_amp   = 0.12;
pulse_speed = 16.0;

time_accum   = 0;
image_alpha  = 1;
image_xscale = 1;
image_yscale = 1;

// NEW: provides two charges once max-size reached
drop_stacks = 1;
reached_max = false