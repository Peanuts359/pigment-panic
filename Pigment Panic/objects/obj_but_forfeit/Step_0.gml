var now = current_time;

// reset the chain if 5s pass between clicks
if (global.forfeit_clicks > 0 && (now - global.forfeit_last_time) > 5000) {
    global.forfeit_clicks = 0;
}

// show 0/1/2 on the button (cap at 2)
image_index = min(global.forfeit_clicks, 2);