var coll_obj = collision_circle(mouse_x, mouse_y, 2, clickables, 0, 1);

var to_redraw = false
var cur_surface = surface_create(256, 256)
surface_set_target(cur_surface)
draw_sprite(spr_brush_1, 0, 12, 72)

switch(state)
{
	case cursor_state.normal:
		if (coll_obj != noone) {
			to_redraw = true
			draw_sprite(spr_brush_2, 0, 12, 72) 
			state = cursor_state.highlighting
			scr_update_brush_color(curr_color)
		}
		break
	case cursor_state.highlighting:
		if (coll_obj == noone) {
			to_redraw = true
			state = cursor_state.normal
			scr_update_brush_color(curr_color)
		}
}

if (variable_global_exists("curr_color")) {
	if (global.curr_color != curr_color) {
		to_redraw = true
		curr_color = global.curr_color
		scr_update_brush_color(curr_color)
	}
}
surface_reset_target()
if to_redraw {
	var new_cursor = sprite_create_from_surface(cur_surface, 0, 0, 256, 256, true, false, 12, 72)
	cursor_sprite = new_cursor
	if current_sprite != noone {	
		sprite_delete(current_sprite)
	}
	current_sprite = new_cursor
}
surface_free(cur_surface)