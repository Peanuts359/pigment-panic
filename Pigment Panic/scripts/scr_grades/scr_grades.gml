enum Grade {
	NONE = -1,
	BRONZE = 0,
	SILVER = 1,
	GOLD = 2,
	MASTERPIECE = 3
}

function grade(lv, rem_time, mstks) {
	if global.forfeited {
		return Grade.NONE;
	}
	if !is_core_lv(lv) {
		if mstks == 0 {
			return Grade.MASTERPIECE;
		} else {
			return Grade.GOLD;
		}
	}
	
	switch (lv) {
		case Level.ONE_THREE:
			if rem_time > 60 {
				if mstks == 0 {
					return Grade.MASTERPIECE;
				} else {
					return Grade.GOLD;
				}
			} else if rem_time > 0 {
				return Grade.SILVER;
			} else {
				return Grade.BRONZE;
			}
			
		case Level.TWO_THREE:
			if rem_time > 60 {
				if mstks == 0 {
					return Grade.MASTERPIECE;
				} else {
					return Grade.GOLD;
				}
			} else if rem_time > 0 {
				return Grade.SILVER;
			} else {
				return Grade.BRONZE;
			}
			
		case Level.THREE_THREE:
			if rem_time > 60 {
				if mstks == 0 {
					return Grade.MASTERPIECE;
				} else {
					return Grade.GOLD;
				}
			} else if rem_time > 0 {
				return Grade.SILVER;
			} else {
				return Grade.BRONZE;
			}
			
		case Level.FOUR_TWO:
			if rem_time > 120 {
				if mstks == 0 {
					return Grade.MASTERPIECE;
				} else {
					return Grade.GOLD;
				}
			} else if rem_time > 0 {
				return Grade.SILVER;
			} else {
				return Grade.BRONZE;
			}
			
		case Level.FIVE_TWO:
			if rem_time > 180 {
				if mstks == 0 {
					return Grade.MASTERPIECE;
				} else {
					return Grade.GOLD;
				}
			} else if rem_time > 60 {
				return Grade.SILVER;
			} else if rem_time > 0 {
				return Grade.BRONZE;
			} else {
				return Grade.NONE;
			}
		
		default:
			return Grade.NONE;
			
	}
}