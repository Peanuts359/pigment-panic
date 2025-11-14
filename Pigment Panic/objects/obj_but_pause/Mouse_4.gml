if global.tutorial_active exit;

// toggle pause
global.paused    = !global.paused;
global.time_mult = global.paused ? 0 : 1;   // freeze dt-based systems
global.input_lock = global.paused;

if (global.paused) {
    // show the forfeit button to the LEFT of the pause button
    if (forfeit_id == noone || !instance_exists(forfeit_id)) {
        var fx = x - sprite_width - 8;
        var fy = y;
        forfeit_id = instance_create_layer(fx, fy, ui_layer_id, obj_but_forfeit);
    }

    // create the pause overlay
    if (overlay_id == noone || !instance_exists(overlay_id)) {
        overlay_id = instance_create_layer(0, 0, ui_layer_id, obj_pause_overlay);
    }

} else {
    // unpause: remove overlay + forfeit button
    if (instance_exists(forfeit_id)) with (forfeit_id) instance_destroy();
    forfeit_id = noone;

    if (instance_exists(overlay_id)) with (overlay_id) instance_destroy();
    overlay_id = noone;
}