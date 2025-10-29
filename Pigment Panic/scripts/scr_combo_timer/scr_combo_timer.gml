function combo_calc_time_max(_count) {
    var min_t = 2; // seconds
    var max_t = 5; // seconds
    var cap   = 5; // after this combo, don’t go lower

    var c = clamp(_count, 0, cap);
    // interpolate from max_t down to min_t
    return max_t - ( (max_t - min_t) * (c / cap) );
}