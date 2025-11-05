var offx = 0;
var offy = 0;

if (shake_timer > 0)
{
    offx = irandom_range(-shake_amt, shake_amt);
    offy = irandom_range(-shake_amt, shake_amt);
}

var xx = x + bar_w / 2 + offx;
var yy = y + bar_h - 2 + offy;

// ensure globals exist
if (!variable_global_exists("combo_count") || 
    !variable_global_exists("combo_time")  || 
    !variable_global_exists("combo_time_max")) {
    exit;
}

// fraction of remaining time (0..1)
var fract = 0;
if (global.combo_time_max > 0) {
    fract = clamp(global.combo_time / global.combo_time_max, 0, 1);
}

// color shifts from blue → red as time runs out
var fill_col = merge_color(bar_fill_high_col, bar_fill_low_col, fract);

// background
draw_set_color(bar_back_col);
draw_rectangle(xx, yy, xx + bar_w, yy + bar_h, false);

// fill
var fill_w = bar_w * fract;
if (fill_w > 0) {
    draw_set_color(fill_col);
    draw_rectangle(xx, yy, xx + fill_w, yy + bar_h, false);
}

// outline
draw_set_color(bar_outline_col);
draw_rectangle(xx, yy, xx + bar_w, yy + bar_h, true);

// text
if (font_used != -1) draw_set_font(font_used);
draw_set_color(txt_col);

var combo_txt = "COMBO " + string(global.combo_count);
draw_text(xx, yy + bar_h + 2, combo_txt);
