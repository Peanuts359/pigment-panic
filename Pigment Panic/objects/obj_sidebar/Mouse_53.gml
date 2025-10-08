/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 54A39C4F
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// obj_input : Global Left Pressed$(13_10)var mx = mouse_x, my = mouse_y;$(13_10)$(13_10)// Drops first (they win)$(13_10)var d = collision_point(mx, my, obj_drop, false, true);$(13_10)if (d != noone) {$(13_10)    with (d) {$(13_10)        // your drop click logic, then destroy if needed$(13_10)        instance_destroy();$(13_10)    }$(13_10)    exit;$(13_10)}$(13_10)$(13_10)// Then tiles$(13_10)var t = collision_point(mx, my, obj_tile_parent, false, true);$(13_10)if (t != noone) {$(13_10)    with (t) {$(13_10)        // your tile click logic$(13_10)        image_index = 1;$(13_10)        global.score += 50;$(13_10)    }$(13_10)}"
/// @description Execute Code
// obj_input : Global Left Pressed
var mx = mouse_x, my = mouse_y;

// Drops first (they win)
var d = collision_point(mx, my, obj_drop, false, true);
if (d != noone) {
    with (d) {
        // your drop click logic, then destroy if needed
        instance_destroy();
    }
    exit;
}

// Then tiles
var t = collision_point(mx, my, obj_tile_parent, false, true);
if (t != noone) {
    with (t) {
        // your tile click logic
        image_index = 1;
        global.score += 50;
    }
}