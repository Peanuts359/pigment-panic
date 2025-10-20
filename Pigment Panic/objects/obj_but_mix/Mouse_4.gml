audio_play_sound(snd_mistake, 0, false);

/// obj_but_mix : Left Pressed

// collect inputs by slot_index
inputs = array_create(3, noone);
found  = 0;
with (obj_mixer_input) {
    // ensure the var exists even if someone forgot the variable def
    if (!variable_instance_exists(id, "slot_index")) slot_index = -1;

    if (slot_index >= 0 && slot_index <= 2) {
        if (other.inputs[slot_index] == noone) {
            other.inputs[slot_index] = id;
            ++other.found;
        } else {
            show_debug_message("[MIX] duplicate slot_index " + string(slot_index));
        }
    } else {
        show_debug_message("[MIX] input missing/invalid slot_index on " + string(id));
    }
}

// collect output
out = noone;
with (obj_mixer_output) {
    other.out = id;
}

if (out == noone) { show_debug_message("[MIX] No output slot found."); exit; }
if (out.box_color != Color.NONE) { show_debug_message("[MIX] Output already contains a color."); exit; }

show_debug_message("[MIX] inputs found = " + string(found)
    + "  ids = [" + string(inputs[0]) + "," + string(inputs[1]) + "," + string(inputs[2]) + "]");

// read colors (treat missing as NONE)
var a = (inputs[0] != noone) ? inputs[0].box_color : Color.NONE;
var b = (inputs[1] != noone) ? inputs[1].box_color : Color.NONE;
var c = (inputs[2] != noone) ? inputs[2].box_color : Color.NONE;

show_debug_message("[MIX] a=" + string(a) + " b=" + string(b) + " c=" + string(c));

var r = mix3(a, b, c);
show_debug_message("[MIX] result=" + string(r));

if (r == Color.NONE) exit;

// clear inputs
for (var i = 0; i < 3; i++) if (inputs[i] != noone) with (inputs[i]) {
    box_color   = Color.NONE;
    image_index = 0;
    image_blend = c_white;
}

// write result to output
with (out) {
    box_color   = r;
    image_index = 5;
    var rgb = global.Color_rgb[box_color];
    image_blend = make_color_rgb(rgb[0], rgb[1], rgb[2]);
}

