var coll_obj = collision_circle(mouse_x, mouse_y, 2, clickables, 0, 1);

switch(state)
{
	case cursor_state.normal:
		if (coll_obj != noone) {
			var cur_surface = surface_create(256, 256)
			surface_set_target(cur_surface)
			draw_sprite(spr_brush_1, 0, 12, 72)
			draw_sprite(spr_brush_2, 0, 12, 72)
			surface_reset_target()
			var new_cursor = sprite_create_from_surface(cur_surface, 0, 0, 256, 256, true, false, 12, 72)
			cursor_sprite = new_cursor
			state = cursor_state.highlighting
		}
		break
	case cursor_state.highlighting:
		if (coll_obj == noone) {
			cursor_sprite = spr_brush_1
			state = cursor_state.normal
		}
}
