/// scr_color_mixer.gml

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
    if (a == b) return a;
    if (a == Color.NONE) return b;
    if (b == Color.NONE) return a;

    var cm = ds_map_find_value(global.mix_map, a);
    var r  = is_undefined(cm) ? -1 : cm.mix_result(b);
    if (r != -1) return r;

    cm = ds_map_find_value(global.mix_map, b);
    r  = is_undefined(cm) ? -1 : cm.mix_result(a);
    return r; // could be -1 if not defined
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

    // n == 3: explicit rules

    // R+B+Y -> BROWN
    var hasR = array_contains(cols, Color.RED);
    var hasB = array_contains(cols, Color.BLUE);
    var hasY = array_contains(cols, Color.YELLOW);
    if (hasR && hasB && hasY) return Color.BROWN;

    // (primary+primary -> secondary) + BLACK/WHITE/NONE
    var idx = [[0,1,2],[0,2,1],[1,2,0]];
    for (var i = 0; i < 3; i++) {
        var i0 = idx[i][0], i1 = idx[i][1], k = idx[i][2];
        var p = mix2(cols[i0], cols[i1]);  // pair result
        if (is_secondary(p)) {
            var third = cols[k];
            if (third == Color.BLACK) return dark_of(p);
            if (third == Color.WHITE) return light_of(p);
            if (third == Color.NONE)  return p; // safety
        }
    }

    // WHITE + BLACK + NONE -> GRAY (kept for robustness)
    if ( (a==Color.WHITE || b==Color.WHITE || c==Color.WHITE) &&
         (a==Color.BLACK || b==Color.BLACK || c==Color.BLACK) &&
         (a==Color.NONE  || b==Color.NONE  || c==Color.NONE) ) {
        return Color.GRAY;
    }

    // base(non-tinted) + BLACK/WHITE + NONE -> dark/light base
    {
        var base = Color.NONE, tint = Color.NONE;
        var arr = [a,b,c];
        var hasNone = (a==Color.NONE || b==Color.NONE || c==Color.NONE);
        for (var j = 0; j < 3; j++) {
            var col = arr[j];
            if (col == Color.NONE) continue;
            if (col == Color.BLACK || col == Color.WHITE) { tint = col; continue; }
            base = col;
        }
        if (hasNone && base != Color.NONE && tint != Color.NONE) {
            return (tint == Color.BLACK) ? dark_of(base) : light_of(base);
        }
    }

    // Fallback: associative pair mixing
    var r = mix2(cols[0], cols[1]);
    r = mix2(r, cols[2]);
    return r;
}
