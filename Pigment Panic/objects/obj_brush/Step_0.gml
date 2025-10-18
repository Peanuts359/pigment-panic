var coll_obj = collision_circle(mouse_x, mouse_y, 2, 
								array_union(default_clickables, unique_clickables[current_brush]), 
								0, 1);

switch (state) {
    case cursor_state.normal:
        if (coll_obj != noone) {
            state = cursor_state.highlighting;
            to_redraw = true;
        }
        break;

    case cursor_state.highlighting:
        if (coll_obj == noone) {
            state = cursor_state.normal;
            to_redraw = true;
        }
        break;
}

// Color changes require redraw
if (variable_global_exists("curr_color")) {
    if (global.curr_color != curr_color) {
        curr_color = global.curr_color;
        to_redraw = true;
    }
}


// Ensure we have a surface
if (!surface_exists(cur_surface)) {
    cur_surface = surface_create(256, 256);
    to_redraw   = true;
}

// Rebuild the cursor image only when needed
if (to_redraw) {
    var x_ori = origins[current_brush][0];
    var y_ori = origins[current_brush][1];

    surface_set_target(cur_surface);
    draw_clear_alpha(c_black, 0);               // important: clear previous pixels

    // base brush
    draw_sprite(brushes[current_brush], 0, x_ori, y_ori);

    // draw outline only while highlighting
    if (state == cursor_state.highlighting) {
        draw_sprite(outlines[current_brush], 0, x_ori, y_ori);
    }

    surface_reset_target();

    // replace generated sprite
    var new_id = sprite_create_from_surface(cur_surface, 0, 0, 256, 256, true, false, x_ori, y_ori);
    if (current_sprite != -1) sprite_delete(current_sprite);
    current_sprite = new_id;
    cursor_sprite  = new_id;

    to_redraw = false;
}

// 6) Drip anim
tick += 1;
if (tick >= 120) {
    scr_paintdrip_anim(curr_color);
    tick = 0;
}
