// Draw the stack HUD next to the brush
{
    // convenience locals
    var max_slots   = stack_display_count;        // e.g. 5
    var stack_arr   = global.brush_stack;         // array of colors, bottom..top
    var stack_len   = array_length(stack_arr);

    // screen position where the FIRST (bottom-most) slot should render
    var ui_x0 = mouse_x + stack_offset_x;
    var ui_y0 = mouse_y + stack_offset_y;

    for (var i = 0; i < max_slots; i++) {

        // which color does this box represent?
        // i==0 is bottom of brush_stack
        var color_to_show = Color.NONE;
        if (i < stack_len) {
            color_to_show = stack_arr[i];
        }

        var box_x = ui_x0 + i * (stack_cell_w + stack_cell_gap);
        var box_y = ui_y0;

        // draw slot background
        if (color_to_show == Color.NONE) {
            // empty slot: dark fill
            draw_set_color(stack_slot_empty_col);
            draw_rectangle(
                box_x,
                box_y,
                box_x + stack_cell_w,
                box_y + stack_cell_h,
                false
            );
        } else {
            // filled slot: tint with that paint color
            var rgb = global.Color_rgb[color_to_show]; // [r,g,b]
            draw_set_color(make_color_rgb(rgb[0], rgb[1], rgb[2]));
            draw_rectangle(
                box_x,
                box_y,
                box_x + stack_cell_w,
                box_y + stack_cell_h,
                false
            );
        }

        // OPTIONAL: mark the "active" slot (the top color)
        // We can draw a little white corner or thicker border for the top of stack
        if (i == stack_len - 1 && stack_len > 0) {
            draw_set_color(c_white);
            draw_rectangle(
                box_x,
                box_y,
                box_x + stack_cell_w,
                box_y + stack_cell_h,
                true
            );
        }
    }

    // cleanup draw color
    draw_set_color(c_white);
}
