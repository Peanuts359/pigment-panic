if (instance_number(object_index) > 1) {
    // another cursor already exists (likely the persistent one)
    instance_destroy();
    exit;
}


enum cursor_state { normal, highlighting }

curr_color = -1;
state      = cursor_state.normal;

brushes  = [spr_brush_1, spr_calbrush_1, spr_fanbrush_1, spr_knife_1];
outlines = [spr_brush_2, spr_calbrush_2, spr_fanbrush_2, spr_knife_2];
origins  = [[12,72],[27,81],[24,69],[27,69]];

default_clickables = [obj_start, obj_color_slot, obj_tap, obj_to_level1, obj_to_tutorial,
                      obj_defaultbrush_button, obj_fanbrush_button, obj_calbrush_button, obj_knife_button];
unique_clickables  = [[obj_drop,obj_color_slot,obj_tap],
                      [obj_drop,obj_color_slot,obj_tap],
                      [obj_drop,obj_color_slot,obj_tap],
                      []];

current_brush  = 0;
current_sprite = -1;   // sprite id generated from surface
cursor_sprite  = -1;   // what we draw
cur_surface    = -1;   // reusable surface

tick      = 0;
to_redraw = true;      // force first build

window_set_cursor(cr_none);

// optional default for the global selector if buttons haven’t set it yet
if (!variable_global_exists("sel_brush")) global.sel_brush = current_brush;


function forceRedraw() {
    to_redraw = true;
    scr_update_brush_color(curr_color, origins[current_brush][0], origins[current_brush][1]);
}
