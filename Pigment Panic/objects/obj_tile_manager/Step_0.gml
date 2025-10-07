/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 23170789
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// Start assuming all are colored$(13_10)if (!completed) {$(13_10)    // assume success, then try to disprove it$(13_10)    all_colored = true;   // instance variable on the controller$(13_10)$(13_10)    // visit every tile (includes children of obj_tile_parent)$(13_10)    with (obj_tile_parent) {$(13_10)        if (image_index != 1) {$(13_10)            other.all_colored = false;  // flip the controller's flag$(13_10)        }$(13_10)    }$(13_10)$(13_10)    // if none disproved it, we're done$(13_10)    if (all_colored) {$(13_10)        completed = true;                                 // lock it$(13_10)        dlg_id = show_message_async("All tiles colored!"); // like your manager$(13_10)    }$(13_10)}$(13_10)"
/// @description Execute Code
// Start assuming all are colored
if (!completed) {
    // assume success, then try to disprove it
    all_colored = true;   // instance variable on the controller

    // visit every tile (includes children of obj_tile_parent)
    with (obj_tile_parent) {
        if (image_index != 1) {
            other.all_colored = false;  // flip the controller's flag
        }
    }

    // if none disproved it, we're done
    if (all_colored) {
        completed = true;                                 // lock it
        dlg_id = show_message_async("All tiles colored!"); // like your manager
    }
}