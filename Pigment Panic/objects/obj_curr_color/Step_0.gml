if (global.curr_color != -1) {
	self.image_index = 1
	self.image_blend = make_color_rgb(
							global.Color_rgb[global.curr_color][0],
							global.Color_rgb[global.curr_color][1],
							global.Color_rgb[global.curr_color][2])
} else {
	self.image_index = 0
}

x = mouse_x - 32
y = mouse_y - 32