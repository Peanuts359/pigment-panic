
if global.spawn_pen {
	brush_timer -= 1 * global.time_mult
}
if (brush_timer <= 0) {
	if global.spawn_pen {
		instance_create_layer(-100, -100, "Drops", obj_corr_brush)
	}
	global.spawn_pen = false
	brush_timer = 600
}