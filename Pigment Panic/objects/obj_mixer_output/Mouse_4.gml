/// @description Execute Code
// if both the current and box colors are blank, do nothing
if (global.curr_color == Color.NONE && box_color == Color.NONE) {
    exit;
}

// if exactly one of the current and mixer output colors is blank, swap them
if ((global.curr_color == Color.NONE) ^^ (box_color == Color.NONE)) {
    var tmp            = global.curr_color;
    global.curr_color  = box_color;
    box_color          = tmp;
	
	if (box_color != Color.NONE) {
		self.image_index = 5
		self.image_blend = make_color_rgb(global.Color_rgb[box_color][0], 
							global.Color_rgb[box_color][1], 
							global.Color_rgb[box_color][2])
	} else {
		self.image_index = 0	
	}
	exit;
}