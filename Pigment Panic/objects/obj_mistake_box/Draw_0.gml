/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 662B634F
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)draw_self();$(13_10)$(13_10)var w  = sprite_get_width(sprite_index)  * abs(image_xscale);$(13_10)var h  = sprite_get_height(sprite_index) * abs(image_yscale);$(13_10)var cx = x - sprite_xoffset * image_xscale + w * 0.5;$(13_10)var cy = y - sprite_yoffset * image_yscale + h * 0.5;$(13_10)$(13_10)draw_set_font(fnt_ui);$(13_10)draw_set_halign(fa_center);$(13_10)draw_set_valign(fa_middle);$(13_10)draw_set_color(c_white);$(13_10)$(13_10)draw_text(cx - 2, cy - 4, string(global.mistakes));"
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

draw_text(cx - 2, cy - 4, string(global.mistakes));