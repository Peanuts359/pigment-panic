var coll_obj = collision_circle(mouse_x, mouse_y, 2, 
								array_union(default_clickables, unique_clickables[current_brush]), 
								0, 1);

var cur_surface = surface_create(256, 256)
surface_set_target(cur_surface)
var x_ori = origins[current_brush][0]
var y_ori = origins[current_brush][1]
draw_sprite(brushes[current_brush], 0, x_ori, y_ori)

var to_redraw = false
// If the left mouse is clicked, then we should always redraw (and recall the color)
if mouse_check_button_pressed(mb_left) {
	to_redraw = true
	scr_update_brush_color(curr_color, x_ori, y_ori)
}

// Update cursor sprite
switch(state)
{
	case cursor_state.normal:
		if (coll_obj != noone) {
			to_redraw = true
			draw_sprite(outlines[current_brush], 0, x_ori, y_ori) 
			state = cursor_state.highlighting
			scr_update_brush_color(curr_color, x_ori, y_ori)
		}
		break
	case cursor_state.highlighting:
		if (coll_obj == noone) {
			to_redraw = true
			state = cursor_state.normal
			scr_update_brush_color(curr_color, x_ori, y_ori)
		} else {
			draw_sprite(outlines[current_brush], 0, x_ori, y_ori)
		}
}


if (variable_global_exists("curr_color")) {
	if (global.curr_color != curr_color) {
		to_redraw = true
		curr_color = global.curr_color
		scr_update_brush_color(curr_color, x_ori, y_ori)
	}
}

// Drip animation
tick += 1
if (tick >= 120) {
	scr_paintdrip_anim(curr_color)
	tick = 0
}

// Decide whether to draw the new sprite

surface_reset_target()
if to_redraw {
	var new_cursor = sprite_create_from_surface(cur_surface, 0, 0, 256, 256, true, false, x_ori, y_ori)
	cursor_sprite = new_cursor
	if current_sprite != noone {	
		sprite_delete(current_sprite)
	}
	current_sprite = new_cursor
}
surface_free(cur_surface)

