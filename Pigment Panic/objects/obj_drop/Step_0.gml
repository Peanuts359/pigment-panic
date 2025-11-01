/// obj_drop : Step
// tick down life (honor any global time multiplier you use)
self.lifetime -= (delta_time / 1_000_000) * global.time_mult;
if (self.lifetime <= 0) { instance_destroy(); exit; }

// progress 0..1 (0 = just spawned, 1 = about to vanish)
var p = 1 - (self.lifetime / self.lifetime_max);

// ----- growth -----
// up to grow_portion (0.75), scale eases linearly 1 → max_scale
var grow_edge = self.grow_portion;           // 0.75
var grow_t    = clamp(p / grow_edge, 0, 1);  // 0..1 only in first 75%
var scale_now = 1 + (self.max_scale - 1) * grow_t;
image_xscale  = scale_now;
image_yscale  = scale_now;

// ----- flicker in last 25% -----
// When p >= 0.75, blink self.flicker_blinks times uniformly.
if (p >= (1 - self.flicker_portion)) {
    // map last quarter to 0..1
    var f = (p - (1 - self.flicker_portion)) / self.flicker_portion; // 0..1
    // each blink = on+off → 2 phases; total phases = blinks*2
    var phases = self.flicker_blinks * 2;      // 3 blinks → 6 phases
    var phase_index = floor(f * phases);       // 0..(phases-1)
    var is_on = (phase_index % 2 == 0);        // even = visible, odd = dim
    image_alpha = is_on ? self.alpha_on : self.alpha_off;
} else {
    image_alpha = self.alpha_on;
}
