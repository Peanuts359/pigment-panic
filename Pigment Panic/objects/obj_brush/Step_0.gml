if (keyboard_check_pressed(vk_f1)) {
    show_debug_message("cursor count = " + string(instance_number(obj_brush)));
}

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

// held color change forces redraw
if (variable_global_exists("curr_color")) {
    if (global.curr_color != curr_color) { curr_color = global.curr_color; to_redraw = true; }
}

// clicks force rebuild (if drip/strip visuals update)
if (mouse_check_button_pressed(mb_left)) to_redraw = true;

// ensure we have a surface
if (!surface_exists(cur_surface)) { cur_surface = surface_create(256, 256); to_redraw = true; }

// rebuild only when needed
if (to_redraw) {
    var x_ori = origins[current_brush][0];
    var y_ori = origins[current_brush][1];

    surface_set_target(cur_surface);
    draw_clear_alpha(c_black, 0);               // prevent ghosting

    draw_sprite(brushes[current_brush], 0, x_ori, y_ori);
    if (state == cursor_state.highlighting) {
        draw_sprite(outlines[current_brush], 0, x_ori, y_ori);
    }
    surface_reset_target();

    var new_id = sprite_create_from_surface(cur_surface, 0, 0, 256, 256, true, false, x_ori, y_ori);
    if (current_sprite != -1) sprite_delete(current_sprite);
    current_sprite = new_id;
    cursor_sprite  = new_id;

    to_redraw = false;
}

// drip animation
tick += 1;
if (tick >= 120) { scr_paintdrip_anim(curr_color); tick = 0; }

