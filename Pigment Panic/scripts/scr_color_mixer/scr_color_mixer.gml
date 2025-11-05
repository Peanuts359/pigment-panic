function is_secondary(col) {
    return (col == Color.ORANGE) || (col == Color.GREEN) || (col == Color.PURPLE);
}

function dark_of(col) {
    switch (col) {
        case Color.RED:    return Color.D_RED;
        case Color.BLUE:   return Color.D_BLUE;
        case Color.YELLOW: return Color.D_YELLOW;
        case Color.ORANGE: return Color.D_ORANGE;
        case Color.GREEN:  return Color.D_GREEN;
        case Color.PURPLE: return Color.D_PURPLE;
        case Color.BROWN:  return Color.D_BROWN;
        case Color.GRAY:   return Color.D_GRAY;
        default: return col;
    }
}

function light_of(col) {
    switch (col) {
        case Color.RED:    return Color.L_RED;
        case Color.BLUE:   return Color.L_BLUE;
        case Color.YELLOW: return Color.L_YELLOW;
        case Color.ORANGE: return Color.L_ORANGE;
        case Color.GREEN:  return Color.L_GREEN;
        case Color.PURPLE: return Color.L_PURPLE;
        case Color.BROWN:  return Color.L_BROWN;
        case Color.GRAY:   return Color.L_GRAY;
        default: return col;
    }
}

function mix2(a, b) {
    // SAME COLOR → invalid mix
    if (a == b) return Color.NONE;

    if (a == Color.NONE) return b;
    if (b == Color.NONE) return a;

    var cm = ds_map_find_value(global.mix_map, a);
    var r  = is_undefined(cm) ? Color.NONE : cm.mix_result(b);
    if (r != -1) return r;

    cm = ds_map_find_value(global.mix_map, b);
    r  = is_undefined(cm) ? Color.NONE : cm.mix_result(a);
    return r; // Color.NONE if no rule
}


function mix3(a, b, c) {
    // collect non-empty
    var cols = [];
    if (a != Color.NONE) array_push(cols, a);
    if (b != Color.NONE) array_push(cols, b);
    if (c != Color.NONE) array_push(cols, c);

    var n = array_length(cols);
    if (n == 0) return Color.NONE;
    if (n == 1) return cols[0];
    if (n == 2) return mix2(cols[0], cols[1]);
	
	var comb = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]
	var outs = []
	for (var i = 0; i < array_length(comb); i += 1) {
		var out1 = mix2(cols[comb[i][0]], cols[comb[i][1]])
		if out1 == cols[comb[i][0]] {
			out1 = Color.NONE	
		}
		var out = mix2(out1, cols[comb[i][2]])
		if out == cols[comb[i][2]] {
			out = Color.NONE	
		}
		if out != Color.NONE {
			array_push(outs, out)	
		}
	}
	if array_length(outs) > 0 {
		return outs[0]	
	} else {
		return Color.NONE	
	}
}



