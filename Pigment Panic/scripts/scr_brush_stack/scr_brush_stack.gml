function brush_is_empty() {
    return array_length(global.brush_stack) == 0;
}

function brush_is_full() {
    return array_length(global.brush_stack) >= global.brush_max;
}

function brush_top() {
    if (brush_is_empty()) return Color.NONE;
    return global.brush_stack[array_length(global.brush_stack) - 1];
}

function brush_push(_col) {
    if (_col == Color.NONE) return false;
    if (brush_is_full())    return false;
    array_push(global.brush_stack, _col);
    return true;
}

function brush_pop_top() {
    if (brush_is_empty()) return Color.NONE;
    return array_pop(global.brush_stack);
}

function brush_pop_bottom() {
    if (brush_is_empty()) return Color.NONE;
    var c = global.brush_stack[0];
    array_delete(global.brush_stack, 0, 1);
    return c;
}