enum cursor_state
{
	normal,
	highlighting
}

curr_color = -1
state = cursor_state.normal

brushes = [spr_brush_1, spr_calbrush_1, spr_fanbrush_1, spr_knife_1]
outlines = [spr_brush_2, spr_calbrush_2, spr_fanbrush_2, spr_knife_2]
origins = [[12, 72], [27, 81], [24, 69], [27, 69]]
paint_strips = [spr_paint_White, spr_calpaint_White, spr_fanpaint_White]

default_clickables = [obj_start, obj_color_slot, obj_tap, obj_to_level1, obj_to_tutorial,
					  obj_defaultbrush_button, obj_fanbrush_button, obj_calbrush_button, obj_knife_button]
unique_clickables = [[obj_drop, obj_color_slot, obj_tap], 
					 [obj_drop, obj_color_slot, obj_tap], 
					 [obj_drop, obj_color_slot, obj_tap],
					 []]

current_sprite = noone

tick = 0
current_brush = 0

// Every frame, this varaible decides whether we need to redraw the sprite
to_redraw = false

// Initialize cursor
window_set_cursor(cr_none)
cursor_sprite = brushes[current_brush]

function forceRedraw() {
	to_redraw = true
	scr_update_brush_color(curr_color, origins[current_brush][0], origins[current_brush][1])
}