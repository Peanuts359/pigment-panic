var a = async_load;

// only respond to the forfeit dialog
if (a[? "id"] != global.forfeit_dialog) exit;

// result: 1 = Yes, 0 = No
if (a[? "result"] == 1) {
    // YES → forfeit
    global.forfeited    = true;
    global.timer_active = false;
	global.forfeit_dialog = -1;
	room_goto(rm_result)
	exit;
}

// reset dialog id
global.forfeit_dialog = -1;