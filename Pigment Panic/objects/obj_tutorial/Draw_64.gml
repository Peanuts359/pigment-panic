/// @description Draw GUI
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// dim
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);

// panel
draw_set_alpha(1);
var pw = min(520, gw - 40);
var ph = min(360, gh - 80);
var px = (gw - pw) * 0.5;
var py = (gh - ph) * 0.5;

draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(px, py, px + pw, py + ph, false);
draw_set_color(c_white);
draw_rectangle(px, py, px + pw, py + ph, true);

// title
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(px + 16, py + 12, "Hint");

// hint sprite centered in the panel
if (hint_sprite != -1) {
    var hx = px + pw * 0.5;
    var hy = py + ph * 0.5;
    draw_sprite_ext(hint_sprite, 0, hx, hy, 1, 1, 0, c_white, 1);
}

// prompt at bottom
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(gw * 0.5, py + ph - 12, "Click or press Space to start");