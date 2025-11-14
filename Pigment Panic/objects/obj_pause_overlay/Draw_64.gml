/// obj_pause_overlay : Draw GUI
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// 1) Dim the screen
draw_set_alpha(alpha_dim);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);

// back to normal alpha
draw_set_alpha(1);

// ----------------------------------------------------
// 2) "Paused" label in the top–left corner
// ----------------------------------------------------
draw_set_font(fnt_ui);            // or -1 if you're using the default
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var margin = 16;
draw_text(margin, margin, "Paused");

// ----------------------------------------------------
// 3) Hint sprite in the middle of the screen
// ----------------------------------------------------
// get_hint(lv) should return a sprite index or -1 if none
var spr_hint = get_hint(global.lv_name);

if (spr_hint != -1) {
    var cx = gw * 0.5;
    var cy = gh * 0.5;

    // origin is already centre, so this will centre the sprite
    draw_sprite(spr_hint, 0, cx, cy);
}