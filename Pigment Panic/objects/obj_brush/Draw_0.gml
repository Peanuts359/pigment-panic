/// obj_brush : Draw

// 1. draw the actual brush sprite following the mouse
var mx = mouse_x;
var my = mouse_y;
draw_sprite_ext(
    brushes[current_brush], // sprite index for this brush type
    0,
    mx,
    my,
    1, 1,
    0,
    c_white,
    1
);

// 2. draw the stack HUD next to the brush

// a) tunable visual constants
var STACK_OX   = 20; // shift right from brush origin
var STACK_OY   =  8; // shift down from brush origin
var SLOT_W     = 10; // each little color box width  (in pixels)
var SLOT_H     = 10; // each little color box height (in pixels)
var SLOT_GAP   =  2; // spacing between boxes
var MAX_SLOTS  = global.brush_max; // how many boxes to show

// b) top-left corner of the first slot
//    we anchor at the brush position, plus our offsets
var panel_x = mx + STACK_OX;
var panel_y = my + STACK_OY;

// c) get current stack reference
var bs  = global.brush_stack;
var len = array_length(bs);

// We'll draw left → right, oldest color first.
// So slot 0 corresponds to bs[0] (bottom of stack),
// and the rightmost slot is the "top" (latest pushed).
for (var i = 0; i < MAX_SLOTS; i++) {

    // position of this slot on screen
    var slot_x = panel_x + i * (SLOT_W + SLOT_GAP);
    var slot_y = panel_y;

    // which brush color index goes here?
    // if i < len, we have a real color; otherwise it's empty
    if (i < len) {
        var col_id = bs[i];

        // Get its RGB from your palette table
        var r = global.Color_rgb[col_id][0];
        var g = global.Color_rgb[col_id][1];
        var b = global.Color_rgb[col_id][2];

        // filled rect
        draw_set_alpha(1);
        draw_set_color(make_color_rgb(r, g, b));
        draw_rectangle(slot_x, slot_y, slot_x + SLOT_W, slot_y + SLOT_H, false);

        // outline
        draw_set_color(c_black);
        draw_rectangle(slot_x, slot_y, slot_x + SLOT_W, slot_y + SLOT_H, true);

    } else {
        // empty slot: transparent inside, black outline

        // transparent fill just to clear (alpha 0)
        draw_set_alpha(0);
        draw_set_color(c_white);
        draw_rectangle(slot_x, slot_y, slot_x + SLOT_W, slot_y + SLOT_H, false);

        // outline visible
        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_rectangle(slot_x, slot_y, slot_x + SLOT_W, slot_y + SLOT_H, true);
    }
}
