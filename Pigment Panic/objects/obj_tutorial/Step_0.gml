if !is_popup_needed(global.lv_name) {
	exit;
}

var pressed =
    mouse_check_button_pressed(mb_left) ||
    keyboard_check_pressed(vk_space)    ||
    keyboard_check_pressed(vk_enter);

if (pressed) {
    global.tutorial_active = false;

    // now actually start the timer for core levels
    if (is_core_lv(global.lv_name)) {
        global.timer_active = true;
    }

    instance_destroy();
}