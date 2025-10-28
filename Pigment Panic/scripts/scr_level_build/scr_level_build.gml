function scr_level_build(tile_matrix, x_origin, y_origin, xscale = 2, yscale = 2, x_sep = 0, y_sep = 0) 
{
	rows = array_length(tile_matrix)
	for (i = 0; i < rows; i++) {
		cols = array_length(tile_matrix[i])
		for (j = 0; j < cols; j++) {
			var _new_tile = instance_create_layer(x, y, "Instances", obj_tile_new, {
				image_xscale: xscale,
				image_yscale: yscale,
				desired_color: tile_matrix[i][j]
			});
			_new_tile.x = x_origin + j * _new_tile.sprite_width * (1 + x_sep)
			_new_tile.y = y_origin + i * _new_tile.sprite_height * (1 + y_sep)
		}
	}
}