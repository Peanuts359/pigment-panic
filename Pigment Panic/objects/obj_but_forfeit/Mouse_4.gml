if (global.forfeit_dialog != -1) exit;

var now_ms = current_time;

if (global.forfeit_clicks == 0) {
    global.forfeit_clicks = 1;
    global.forfeit_last_time = now_ms;
    exit;
} else {
    if (now_ms - global.forfeit_last_time > 5000) {
        global.forfeit_clicks = 1;
        global.forfeit_last_time = now_ms;
        exit;
    } else {
        global.forfeit_clicks += 1;
        global.forfeit_last_time = now_ms;
    }
}

if (global.forfeit_clicks < 3) {
    exit;
}

global.forfeited    = true;
global.timer_active = false;
global.forfeit_clicks = 0;
global.forfeit_dialog = show_message_async("You forfeited the level.");
