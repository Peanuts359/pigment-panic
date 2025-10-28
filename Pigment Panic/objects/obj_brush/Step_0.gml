/// Step — rebuild cursor image only when needed

// brush selection
if (variable_global_exists("sel_brush")) {
    if (global.sel_brush != current_brush) {
        current_brush = global.sel_brush;
        to_redraw = true;
    }
}

// hover test for highlight state
var coll_obj = collision_circle(
    mouse_x, mouse_y, 2,
    array_union(default_clickables, unique_clickables[current_brush]),
    false, true
);

switch (state) {
    case cursor_state.normal:
        if (coll_obj != noone) { state = cursor_state.highlighting; to_redraw = true; }
        break;
    case cursor_state.highlighting:
        if (coll_obj == noone) { state = cursor_state.normal; to_redraw = true; }
        break;
}

// held color (top of stack) change forces redraw
var top_col = brush_top(); // will return Color.NONE if stack empty
if (top_col != curr_color) {
    curr_color = top_col;
    to_redraw  = true;
}

// clicks force rebuild (if drip/strip visuals update)
if (mouse_check_button_pressed(mb_left)) to_redraw = true;

// ensure we have a surface
if (!surface_exists(cur_surface)) { cur_surface = surface_create(256, 256); to_redraw = true; }

// rebuild only when needed
if (to_redraw) {
    var x_ori = origins[current_brush][0];
    var y_ori = origins[current_brush][1];

    // draw into the surface
    surface_set_target(cur_surface);
    draw_clear_alpha(c_black, 0); // transparent background

    // draw base brush
    draw_sprite(brushes[current_brush], 0, x_ori, y_ori);

    // draw outline if highlighting
    if (state == cursor_state.highlighting) {
        draw_sprite(outlines[current_brush], 0, x_ori, y_ori);
    }

    surface_reset_target();

    // create sprite from that surface
    var new_id = sprite_create_from_surface(
        cur_surface, 0, 0, 256, 256,
        true,  // removeback
        false, // smooth
        x_ori, y_ori
    );

    // clean old sprite
    if (current_sprite != -1) sprite_delete(current_sprite);

    current_sprite = new_id;
    cursor_sprite  = new_id;

    to_redraw = false;
}

// drip animation
tick++;
if (tick >= 120) {
    scr_paintdrip_anim(curr_color);
    tick = 0;
}

