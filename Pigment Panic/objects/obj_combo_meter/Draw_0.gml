/// @description draw the combo bar HUD

var draw_x = x;
var draw_y = y;

// protect against missing globals
var combo_now     = 0;
var combo_cap     = 1; // avoid div by 0 fallback
if (variable_global_exists("combo"))      combo_now = global.combo;
if (variable_global_exists("combo_max"))  combo_cap = max(1, global.combo_max);

// clamp fraction 0..1
var fract = combo_now / combo_cap;
if (fract < 0) fract = 0;
if (fract > 1) fract = 1;

// lerp fill color from low→high
var fill_col = merge_color(bar_fill_low_col, bar_fill_high_col, frac);

// draw bar background
draw_set_color(bar_back_col);
draw_rectangle(draw_x, draw_y, draw_x + bar_w, draw_y + bar_h, false);

// draw fill portion
var fill_w = bar_w * fract;
if (fill_w > 0) {
    draw_set_color(fill_col);
    draw_rectangle(draw_x, draw_y, draw_x + fill_w, draw_y + bar_h, false);
}

// outline
draw_set_color(bar_outline_col);
draw_rectangle(draw_x, draw_y, draw_x + bar_w, draw_y + bar_h, true);

// label text under the bar
if (font_used != -1) {
    draw_set_font(font_used);
}
draw_set_color(txt_col);
var label = "COMBO: " + string(floor(combo_now));
draw_text(draw_x + bar_w / 2, draw_y + bar_h + 2, label);
