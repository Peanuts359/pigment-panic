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

    // R + B + Y -> BROWN
    var hasR = array_contains(cols, Color.RED);
    var hasB = array_contains(cols, Color.BLUE);
    var hasY = array_contains(cols, Color.YELLOW);
    if (hasR && hasB && hasY) return Color.BROWN;

    var hasWhite = array_contains(cols, Color.WHITE);
    var hasBlack = array_contains(cols, Color.BLACK);
    var hasNone  = (a==Color.NONE || b==Color.NONE || c==Color.NONE);

    // collect colors excluding pure tints (white/black)
    var base = [];
    for (var i = 0; i < 3; i++) {
        var ci = cols[i];
        if (ci != Color.WHITE && ci != Color.BLACK) array_push(base, ci);
    }

    // ---- TINT RULES (only use the two non-tint colors) ----
    if (hasWhite) {
        if (array_length(base) == 2) {
            var m = mix2(base[0], base[1]);         // excludes WHITE
            if (m != Color.NONE) return light_of(m);
            return Color.NONE;                       // don't tint via (color, WHITE) + 3rd color
        } else if (array_length(base) == 1 && hasNone) {
            return light_of(base[0]);                // base + WHITE + NONE
        } else {
            return Color.NONE;                       // no valid white-tint scenario
        }
    }

    if (hasBlack) {
        if (array_length(base) == 2) {
            var m2 = mix2(base[0], base[1]);        // excludes BLACK
            if (m2 != Color.NONE) return dark_of(m2);
            return Color.NONE;                      // don't tint via (color, BLACK) + 3rd color
        } else if (array_length(base) == 1 && hasNone) {
            return dark_of(base[0]);                // base + BLACK + NONE
        } else {
            return Color.NONE;                      // no valid black-tint scenario
        }
    }

    // ---- No WHITE/BLACK present: normal associative mixing ----
    var p1 = mix2(cols[0], cols[1]);
    var p2 = mix2(cols[0], cols[2]);
    var p3 = mix2(cols[1], cols[2]);

    var r = (p1 != Color.NONE) ? p1 : ((p2 != Color.NONE) ? p2 : p3);
    if (r == Color.NONE) return Color.NONE;         // nothing mixes

    // fold in remaining colors (safe – none are WHITE/BLACK here)
    r = mix2(r, cols[0]);
    r = mix2(r, cols[1]);
    r = mix2(r, cols[2]);
    return r;
}



