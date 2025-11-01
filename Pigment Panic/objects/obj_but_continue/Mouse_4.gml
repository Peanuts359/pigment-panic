var to_level = global.last_visited_level;
global.timer_active = false;
global.continuing = true;
global.last_visited_level = -1;

var next_room;

switch (to_level) {
    case 1:
        next_room = rm_lv_base;
        break;
    case 2:
        next_room = rm_lv_two_mix;
        break;
    case 3:
        next_room = rm_lv_three_mix;
        break;
    case 4:
        next_room = rm_lv_four;
        break;
	case 5:
		next_room = rm_lv_five;
    default:
        next_room = noone;
        break;
}


if next_room == noone {
	global.playing = true;
	room_goto(rm_level_select);
} else {
	room_goto(next_room);
}
	