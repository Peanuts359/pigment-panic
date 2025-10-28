global.brush_stack = [];
global.brush_max   = 5;

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

default_clickables = [obj_start, obj_color_slot, obj_tap, obj_lv_one, obj_lv_two, obj_lv_three, obj_lv_four,
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

// how wide/high each little stack cell should render
stack_cell_w = 16;
stack_cell_h = 16;

// horizontal gap between cells
stack_cell_gap = 2;

// how far to offset the first cell from the cursor hot point
stack_offset_x = 24; // pixels to the right of the brush head
stack_offset_y = -8; // pixels up/down relative to cursor origin

// how many cells to *display*, regardless of how full the stack is
stack_display_count = global.brush_max;

// background color for an *empty* slot box outline/fill
stack_slot_outline_col = c_black;
stack_slot_empty_col   = c_white;

// thin outline thickness
stack_outline_thickness = 1;

function forceRedraw() {
    to_redraw = true;
    scr_update_brush_color(
        curr_color,
        origins[current_brush][0],
        origins[current_brush][1]
    );
}