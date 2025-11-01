// ignore while a dialog is up
if (global.forfeit_dialog != -1) exit;

var now = current_time;

// start a new chain if first click or chain expired
if (global.forfeit_clicks == 0 || (now - global.forfeit_last_time) > 5000) {
    global.forfeit_clicks = 1;
} else {
    global.forfeit_clicks += 1;
}
global.forfeit_last_time = now;

// 3rd click → forfeit
if (global.forfeit_clicks >= 3) {
    global.forfeited     = true;
    global.timer_active  = false;
    global.forfeit_dialog = show_message_async("You forfeited the level.");
}