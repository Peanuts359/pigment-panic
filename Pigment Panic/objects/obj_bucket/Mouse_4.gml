if global.curr_color != Color.NONE {
	if brush.watercolor_status = 0 {
		brush.watercolor_status = 1
	} else {
		global.curr_color = Color.NONE;	
		brush.watercolor_status = 0
	}
}