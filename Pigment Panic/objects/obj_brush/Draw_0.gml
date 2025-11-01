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

if !global.playing exit;
// 2) draw the stack HUD (vertical; topmost element at the bottom)

// a) tunable visual constants
var STACK_OX   = -20;
var STACK_OY   = -100;
var SLOT_W     = 20; // box width
var SLOT_H     = 20; // box height
var SLOT_GAP   =  2; // vertical spacing
var MAX_SLOTS  = global.brush_max; // number of slots to show

// b) top-left corner of the first (TOP) slot
var panel_x = mx + STACK_OX;
var panel_y = my + STACK_OY;

// c) current stack
var bs  = global.brush_stack;
var len = array_length(bs);

// We draw TOP → BOTTOM visually (s = 0 at top).
// Mapping so the BOTTOM slot shows the TOP of the stack (bs[len-1]):
//   idx = len - (MAX_SLOTS - s)
// That makes:
//   s == MAX_SLOTS-1  → idx = len-1  (top of stack at bottom slot)
//   s == MAX_SLOTS-2  → idx = len-2  (next up), etc.
for (var s = 0; s < MAX_SLOTS; s++) {

    var slot_x = panel_x;
    var slot_y = panel_y + s * (SLOT_H + SLOT_GAP);

    // outline first so empty slots are visible
    draw_set_alpha(1);
    draw_set_color(c_olive);
    draw_rectangle(slot_x, slot_y, slot_x + SLOT_W, slot_y + SLOT_H, true);

    var idx = len - (MAX_SLOTS - s);

    if (idx >= 0 && idx < len) {
        var col_id = bs[idx];

        if (col_id != Color.NONE) {
            var r = global.Color_rgb[col_id][0];
            var g = global.Color_rgb[col_id][1];
            var b = global.Color_rgb[col_id][2];

            draw_set_alpha(1);
            draw_set_color(make_color_rgb(r, g, b));
            draw_rectangle(slot_x + 1, slot_y + 1, slot_x + SLOT_W - 1, slot_y + SLOT_H - 1, false);
        } else {
            // explicit empty: transparent fill
            draw_set_alpha(0);
            draw_set_color(c_white);
            draw_rectangle(slot_x + 1, slot_y + 1, slot_x + SLOT_W - 1, slot_y + SLOT_H - 1, false);
        }
    } else {
        // beyond current stack -> empty visual slot
        draw_set_alpha(0);
        draw_set_color(c_white);
        draw_rectangle(slot_x + 1, slot_y + 1, slot_x + SLOT_W - 1, slot_y + SLOT_H - 1, false);
    }
}

// clean up
draw_set_alpha(1);
draw_set_color(c_white);