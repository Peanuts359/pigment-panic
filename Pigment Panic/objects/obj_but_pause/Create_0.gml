forfeit_id  = noone;  
overlay_id   = noone;

ui_layer_name = "Drops";                    // or "UI" if you have one
if (layer_exists(ui_layer_name)) {
    ui_layer_id = layer_get_id(ui_layer_name);
} else {
    // fallback: create a layer at depth 0 if it doesn't exist
    ui_layer_id = layer_create(0, ui_layer_name);
}