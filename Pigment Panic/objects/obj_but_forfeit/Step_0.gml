var now_ms = current_time;

if (global.forfeit_clicks > 0) {
    if (now_ms - global.forfeit_last_time > 5000) {
        global.forfeit_clicks = 0;
    }
}
