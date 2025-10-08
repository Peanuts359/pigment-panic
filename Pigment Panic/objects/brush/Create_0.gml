window_set_cursor(cr_none)
cursor_sprite = spr_brush_1

enum cursor_state
{
	normal,
	highlighting
}

curr_color = -1
state = cursor_state.normal

clickables = [obj_start, obj_drop]