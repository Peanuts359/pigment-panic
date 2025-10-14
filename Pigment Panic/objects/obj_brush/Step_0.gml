var coll_obj = collision_circle(mouse_x, mouse_y, 2, 
								array_union(default_clickables, unique_clickables[current_brush]), 
								0, 1);

var cur_surface = surface_create(256, 256)
surface_set_target(cur_surface)
var x_ori = origins[current_brush][0]
var y_ori = origins[current_brush][1]
draw_sprite(brushes[current_brush], 0, x_ori, y_ori)

to_redraw = false

// Reset watercolor status if not holding paint
if variable_global_exists("curr_color") and global.curr_color == Color.NONE {
	watercolor_status = 0	
}

// Update cursor sprite
switch(state)
{
	case cursor_state.normal:
		if (coll_obj != noone) {
			draw_sprite(outlines[current_brush], 0, x_ori, y_ori) 
			state = cursor_state.highlighting
			forceRedraw()
		}
		break
	case cursor_state.highlighting:
		if (coll_obj == noone) {
			state = cursor_state.normal
			forceRedraw()
		} else {
			draw_sprite(outlines[current_brush], 0, x_ori, y_ori)
		}
}


if (variable_global_exists("curr_color")) {
	if (global.curr_color != curr_color) {
		curr_color = global.curr_color
		forceRedraw()
	}
}

// Drip animation
tick += 1
if (tick >= 120) {
	scr_paintdrip_anim(curr_color)
	tick = 0
}

// If the left mouse is clicked, then we should always redraw (and update the color)
if mouse_check_button_pressed(mb_left) {
	forceRedraw()
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

