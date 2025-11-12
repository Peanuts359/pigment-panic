/// Async Dialog
var did = async_load[? "id"];
if (did != dlg_id) exit;  // not our dialog

var pressed_ok = (async_load[? "status"] == 1); // Yes=1, No=0
var lv = pending_level;

// clear dialog state
dlg_id        = -1;
pending_level = -1;

if (pressed_ok && lv != -1) {
    level_start(lv);
}