/// obj_mixer_output : Left Pressed

// If both are empty, nothing to do
if (brush_top() == Color.NONE && box_color == Color.NONE) exit;

// If the hand is empty, pick up the output color (and clear the box)
if (brush_top() == Color.NONE) {
    if (box_color != Color.NONE) {
        brush_push(box_color); // take the color
        box_color         = Color.NONE; // empty the output

        image_index = 0;     // show "empty" frame
        image_blend = c_white; // optional reset
    }
    exit;
}

// If the hand already holds a color, output box does not accept drops.
exit;