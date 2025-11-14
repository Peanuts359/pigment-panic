if global.paused exit;

// check for combo increase
if (global.combo_count > prev_combo)
{
    shake_timer = shake_time;
}

// remember combo for next frame
prev_combo = global.combo_count;

// tick shake timer
if (shake_timer > 0)
{
    shake_timer -= delta_time / 1_000_000;
}