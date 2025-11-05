/// obj_creds : Draw GUI  (GUI coordinates)
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// 1) Header (baseline at hy because origin is bottom-centre)
var hx = gw * 0.5;
var hy = 140;              // move up/down as you like

// 2) Space below header before the card/table
var gap_below_header = 64;
var y0 = hy + gap_below_header;

// 3) Card/table area (centered under the header)
var table_w = 1200;
var row_gap = 28;
var rows = array_length(roles);      // whatever you defined in Create
var pad_y = 24;
var table_h = rows * row_gap + pad_y * 2;

var tx = hx - table_w * 0.5;         // left edge centered
var ty = y0 + 160;

// background
draw_set_color(make_color_rgb(230,230,230));
draw_rectangle(tx, ty, tx + table_w, ty + table_h, false);
draw_set_color(make_color_rgb(200,200,200));
draw_rectangle(tx, ty, tx + table_w, ty + table_h, true);

// columns
var colL = tx + 40;
var colR = tx + table_w * 0.60;
draw_set_color(c_black);

for (var i = 0; i < rows; i++) {
    var yy = ty + pad_y + i * row_gap;
    draw_text(colL + 20, yy, roles[i]);
    draw_text(colR, yy, names[i]);
}

// 4) footer and blinking prompt
var prompt_alpha = 0.45 + 0.55 * (0.5 + 0.5 * sin(prompt_phase * 8.0)); // blink speed
draw_set_halign(fa_center);

// prompt
draw_set_color(merge_color(col_name, c_white, prompt_alpha));
draw_text(gw * 0.5, gh - 88, prompt_txt);

// footer
draw_set_color(col_name);
draw_text(gw * 0.5, gh - 58, footer_txt);