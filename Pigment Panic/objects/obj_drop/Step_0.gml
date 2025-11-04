if global.paused exit;

var dt = (delta_time / 1_000_000) * global.time_mult;
time_accum += dt;

lifetime -= dt;
if (lifetime <= 0) { instance_destroy(); exit; }

var p = 1 - (lifetime / lifetime_max); // 0..1
var edge_grow  = grow_portion;                   // 0.75
var edge_pulse = grow_portion + pulse_portion;   // 0.95

if (p < edge_grow) {
    // grow 1 → max_scale
    var t = clamp(p / edge_grow, 0, 1);
    var s = 1 + (max_scale - 1) * t;
    image_xscale = s;
    image_yscale = s;

} else if (p < edge_pulse) {
    // pulse (reached max)
    if (!two_stacks) two_stacks = true;
    var s = max_scale * (1 + pulse_amp * sin(time_accum * pulse_speed));
    image_xscale = s;
    image_yscale = s;

} else {
    // rapid shrink + fade
    if (!two_stacks) two_stacks = true;
    var t = clamp((p - edge_pulse) / shrink_portion, 0, 1);
    var s = max_scale * (1 - t);
    image_xscale = max(0.001, s);
    image_yscale = image_xscale;
    image_alpha  = 1 - t;
}
