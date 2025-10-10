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
drip = [spr_paintdrip_Red, spr_paintdrip_Blue, spr_paintdrip_Yellow, spr_paintdrip_Black, 
				 spr_paintdrip_White, spr_paintdrip_Purple, spr_paintdrip_Green, 
				 spr_paintdrip_Orange, spr_paintdrip_Brown]

current_sprite = noone

tick = 0