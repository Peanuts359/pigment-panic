/// @description Execute Code
self.lifetime -= delta_time / 1_000_000 * global.time_mult

var t = 1 - (self.lifetime / self.lifetime_max);
if (t < 0) t = 0;
if (t > 1) t = 1;

var scale_now = 1 + t;

image_xscale = scale_now;
image_yscale = scale_now;

if (self.lifetime <= 0) {
	instance_destroy();
}