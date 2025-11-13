function scr_query_for_color() {
	var colors = [0, 0, 0, 0, 0]
	with (obj_tile_new) {
		if color_index == desired_color {
			continue	
		} else {
			for (var i = 0; i < array_length(global.constituents[desired_color]); i++) {
				colors[global.constituents[desired_color][i]]++	
			}
		}
	}
	var _sum = 0;
	for (var i = 0; i < array_length(colors); i++) {
	    _sum += colors[i];
	}
	var index = 0
	var i = irandom_range(1, _sum)
	while (index < array_length(colors)) {
		if colors[index] == 0 {
			index++	
		} else {
			i--
			colors[index]--
			if i == 0 {
				return index	
			}
		}
	}
	return 0
}