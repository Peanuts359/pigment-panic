y += 0.02 * del_y * global.time_mult
x += 0.02 * del_x * global.time_mult
if hit == false && target_tile != noone && (abs(x - target_tile.x) < 0.1) && (abs(y - target_tile.y) < 0.1) {
	del_x = 0
	del_y = -500
	hit = true
	sprite_index = spr_corrbrush_1
	target_tile.color_index = irandom_range(0, 25)
	if target_tile.fill_status == -1 {
		target_tile.fill_status = 0
		target_tile.tile_health = 1
	}
	alarm[1] = 1200
}