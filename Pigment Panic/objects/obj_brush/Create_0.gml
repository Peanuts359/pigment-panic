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

tints = [[255, 0, 0], [0, 0, 255], [255, 255, 0], [1, 1, 1], [255, 255, 255],
		 [255, 0, 255], [0, 255, 0], [255, 101, 0], [169, 101, 24]]

current_sprite = noone

tick = 0