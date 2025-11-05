/// obj_creds : Step
prompt_phase += delta_time / 1_000_000; // seconds

var pressed =
    keyboard_check_pressed(vk_anykey) ||
    mouse_check_button_pressed(mb_left) ||
    mouse_check_button_pressed(mb_right);

if (pressed) {
    // go back to the room you set in Create (or change it here)
    room_goto(global.return_room);
}