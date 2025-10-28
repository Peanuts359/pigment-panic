/// @description Execute Code
var slot_col = box_color;          // color living in this slot right now
var top_col  = brush_top();        // color on top of brush stack

// CASE 1: slot empty, brush has paint -> deposit top into slot
if (slot_col == Color.NONE && top_col != Color.NONE) {
    if (!brush_is_empty()) {
        box_color   = brush_pop_top();
        image_index = 5;
        image_blend = make_color_rgb(
            global.Color_rgb[box_color][0],
            global.Color_rgb[box_color][1],
            global.Color_rgb[box_color][2]
        );
    }
    exit;
}

// CASE 2: slot has paint, brush has room -> pick up from slot
if (slot_col != Color.NONE && !brush_is_full()) {
    brush_push(slot_col);

    // clear slot visually
    box_color   = Color.NONE;
    image_index = 0;
    image_blend = c_white;
    exit;
}