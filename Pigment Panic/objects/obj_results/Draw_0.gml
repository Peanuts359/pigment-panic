if (sprite_index != -1) draw_self();

var topY    = 120;                // fallback if title not found
var bottomY = room_height - 120;  // fallback if button not found

if (instance_exists(obj_results)) {
    var t  = instance_find(obj_results, 0);
    var th = sprite_get_height(t.sprite_index) * abs(t.image_yscale);
    var ty = t.y - t.sprite_yoffset * t.image_yscale;   // top of title sprite
    topY   = ty + th;                                    // bottom of title
}

if (instance_exists(obj_but_levels)) {
    var b  = instance_find(obj_but_levels, 0);
    var by = b.y - b.sprite_yoffset * b.image_yscale;    // top of button sprite
    bottomY = by;
}

var grade_text = "";
switch (global.grade) {
    case Grade.MASTERPIECE: grade_text = "MASTERPIECE"; break;
    case Grade.GOLD:        grade_text = "GOLD";        break;
    case Grade.SILVER:      grade_text = "SILVER";      break;
    default:                grade_text = "BRONZE";      break;
}

var txt_grade    = "Grade: "    + grade_text;
var txt_mistakes = "Mistakes: " + string(global.mistakes);
var txt_clear    = "Mural Completion: "  + string_format(global.tiles_cleared, 0, 2) + "%";

// ---------- layout & draw ----------
var cx   = room_width * 0.5;             // center X
var midY = (topY + bottomY) * 0.5;       // vertical middle of the gap

draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

var line_h = font_get_size(fnt_ui) + 6;
var y0 = midY - line_h;

draw_text(cx, y0,              txt_grade);
draw_text(cx, y0 + line_h,     txt_mistakes);
draw_text(cx, y0 + line_h * 2, txt_clear);
