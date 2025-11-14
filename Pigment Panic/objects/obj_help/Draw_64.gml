var gw = display_get_gui_width();
var gh = display_get_gui_height();

var prompt_alpha = 0.45 + 0.55 * (0.5 + 0.5 * sin(prompt_phase * 8.0)); // blink speed
draw_set_halign(fa_center);

// prompt
draw_set_color(merge_color(col_name, c_white, prompt_alpha));
draw_text(gw * 0.5, gh - 88, prompt_txt);