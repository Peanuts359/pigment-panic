var to_level = global.last_visited_level;
global.timer_active = false;
global.last_visited_level = -1;

var next_room;

switch (to_level) {
    case 1:
        next_room = rm_lv_one;
        break;
    case 2:
        next_room = rm_lv_two_mix;
        break;
    case 3:
        next_room = rm_lv_three;
        break;
    case 4:
        next_room = rm_lv_four;
        break;
    default:
        next_room = noone;
        break;
}


if next_room == noone {
	room_goto(rm_level_select);
} else {
	room_goto(next_room);
}
	