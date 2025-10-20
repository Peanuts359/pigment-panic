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
    var mix_colors = [];
    if (a != Color.NONE) array_push(mix_colors, a);
    if (b != Color.NONE) array_push(mix_colors, b);
    if (c != Color.NONE) array_push(mix_colors, c);

    var n = array_length(mix_colors);
    if (n == 0) return Color.NONE;
    if (n == 1) return mix_colors[0];
    if (n == 2) return mix2(mix_colors[0], mix_colors[1]);

    // R + B + Y -> BROWN
    var hasR = array_contains(mix_colors, Color.RED);
    var hasB = array_contains(mix_colors, Color.BLUE);
    var hasY = array_contains(mix_colors, Color.YELLOW);
    if (hasR && hasB && hasY) return Color.BROWN;

    // Precompute all pair mixes
    var p1 = mix2(mix_colors[0], mix_colors[1]);
    var p2 = mix2(mix_colors[0], mix_colors[2]);
    var p3 = mix2(mix_colors[1], mix_colors[2]);

    // If WHITE present, try to tint any valid pair result
    if (array_contains(mix_colors, Color.WHITE)) {
        var pair_light = (p1 != Color.NONE) ? p1 : ((p2 != Color.NONE) ? p2 : p3);
        if (pair_light != Color.NONE) return light_of(pair_light);
    }

    // If BLACK present, try to darken any valid pair result
    if (array_contains(mix_colors, Color.BLACK)) {
        var pair_dark = (p1 != Color.NONE) ? p1 : ((p2 != Color.NONE) ? p2 : p3);
        if (pair_dark != Color.NONE) return dark_of(pair_dark);
    }

    // If no pair mixes to anything AND we had WHITE/BLACK in the set, it's invalid
    if (p1 == Color.NONE && p2 == Color.NONE && p3 == Color.NONE) {
        if (array_contains(mix_colors, Color.WHITE) || array_contains(mix_colors, Color.BLACK)) {
            return Color.NONE; // prevents e.g. GREEN + BLUE + WHITE -> WHITE
        }
    }

    // Fallback: associative pair mixing for non-tint triples that do have a valid pair
    var r = (p1 != Color.NONE) ? p1 : ((p2 != Color.NONE) ? p2 : p3);
    if (r == Color.NONE) return Color.NONE;

    // Fold the third color in; order is safe for your rules
    r = mix2(r, mix_colors[0]);
    r = mix2(r, mix_colors[1]);
    r = mix2(r, mix_colors[2]);

    return r;
}


