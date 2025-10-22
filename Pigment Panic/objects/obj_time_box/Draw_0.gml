/// @description Execute Code
draw_self();

var w  = sprite_get_width(sprite_index)  * abs(image_xscale);
var h  = sprite_get_height(sprite_index) * abs(image_yscale);
var cx = x - sprite_xoffset * image_xscale + w * 0.5;
var cy = y - sprite_yoffset * image_yscale + h * 0.5;

draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var secs;
if !global.timer_active {
	secs = "-";
} else {
	secs = string(max(0, ceil(global.time_left)));
}

draw_text(cx + 8, cy - 4, secs);