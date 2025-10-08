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
colors = [spr_paint_Red, spr_paint_Blue, spr_paint_Yellow, spr_paint_Black, spr_paint_White,
		  spr_paint_Purple, spr_paint_Green, spr_paint_Orange, spr_paint_Brown]

current_sprite = noone