/// obj_brush : Draw

// 1. draw the brush cursor sprite itself
if (cursor_sprite != -1) {
    draw_sprite(cursor_sprite, 0, mouse_x, mouse_y);
}

// 2. draw the stack preview beside the brush

// grab sprite info so we can position the stack next to it
var __spr        = cursor_sprite;
if (__spr == -1) exit;

var __spr_w      = sprite_get_width(__spr);
var __spr_h      = sprite_get_height(__spr);
var __spr_off_x  = sprite_get_xoffset(__spr);
var __spr_off_y  = sprite_get_yoffset(__spr);

// figure out where the brush actually appears on screen
var __brush_left = mouse_x - __spr_off_x;
var __brush_top  = mouse_y - __spr_off_y;
var __brush_right = __brush_left + __spr_w;

// panel anchor: slots get drawn to the RIGHT of the brush, upper-aligned
var __panel_x = __brush_right + 4;
var __panel_y = __brush_top;

// stack data
var __cap   = global.brush_max;
var __stack = global.brush_stack;
var __len   = array_length(__stack);

// visual settings for each little box
var __box_w = 12;
var __box_h = 12;
var __gap   = 2;

// We want:
//   first box (closest to the brush) = top of stack
//   next box = next item down
//   etc.
// So box i shows stack[ len-1-i ] if that index >= 0

for (var __i = 0; __i < __cap; __i++) {

    // where this box is drawn
    var __bx = __panel_x + __i * (__box_w + __gap);
    var __by = __panel_y;

    // which stack entry does this box represent?
    var __stack_index = __len - 1 - __i;

    if (__stack_index >= 0) {
        // there's actually a color here
        var __col_id = __stack[__stack_index];

        // get its RGB triplet
        var __r = global.Color_rgb[__col_id][0];
        var __g = global.Color_rgb[__col_id][1];
        var __b = global.Color_rgb[__col_id][2];

        // filled rect
        draw_set_alpha(1);
        draw_set_color(make_color_rgb(__r, __g, __b));
        draw_rectangle(__bx, __by, __bx + __box_w, __by + __box_h, false);

        // outline
        draw_set_color(c_black);
        draw_rectangle(__bx, __by, __bx + __box_w, __by + __box_h, true);

    } else {
        // empty slot: transparent fill with visible border

        // transparent fill (alpha 0, so you can "see through")
        draw_set_alpha(0);
        draw_set_color(c_white);
        draw_rectangle(__bx, __by, __bx + __box_w, __by + __box_h, false);

        // opaque outline so the box is still visible
        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_rectangle(__bx, __by, __bx + __box_w, __by + __box_h, true);
    }
}

// reset draw state
draw_set_alpha(1);
draw_set_color(c_white);
