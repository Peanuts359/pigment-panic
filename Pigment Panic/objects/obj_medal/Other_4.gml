if !global.timer_active {
	global.grade = Grade.NONE;
} else {
	if (global.tiles_cleared >= 100) {
		if (global.mistakes == 0) {
			global.grade = Grade.MASTERPIECE;
		} else {
			global.grade = Grade.GOLD;
		}
	} else if (global.tiles_cleared > 50) {
		global.grade = Grade.SILVER;
	} else {
        global.grade = Grade.BRONZE;
	}
}

self.image_index = global.grade + 1;

