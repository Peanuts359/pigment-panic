var gw = display_get_gui_width();
var gh = display_get_gui_height();

// dim the screen
draw_set_alpha(alpha_dim);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);

// panel
draw_set_alpha(1);
var pw = min(420, gw - 40);
var ph = 180;
var px = (gw - pw) * 0.5;
var py = (gh - ph) * 0.5;

draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(px, py, px + pw, py + ph, false);
draw_set_color(c_white);
draw_rectangle(px, py, px + pw, py + ph, true);

// text
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_ui); // optional: set your UI font

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(px + pw * 0.5, py + ph * 0.5, "Paused");

// (optional) restore defaults if other UI relies on left/top
draw_set_halign(fa_left);
draw_set_valign(fa_top);