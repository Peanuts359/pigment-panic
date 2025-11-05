if (global.combo_count > 0) {	
	var alpha_intensity = global.combo_time / global.combo_time_max
	for (var _t = 0; _t < _width; _t += 1) {
	    var count = min(5, global.combo_count) - 1 
		for (var _s = 0; _s < _height; _s += 1) {
			draw_sprite_part_ext(
		        sprite_index, 
		        0,         
		        _t,        
		        _s,        
		        1,         
		        1,   
		        x + (_t * image_xscale),    
		        y + (_s * image_yscale),         
		        image_xscale,         
		        image_yscale,        
		        combo_colors[count],   
		        intensity_mult[count] * alpha_intensity * compute_radial_intensity(_t, _s)
		    );
		}
		    
	}
}

