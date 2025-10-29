image_alpha += 0.03 * alpha_delta_dir
if (image_alpha < 0) {
	image_alpha = max(image_alpha, 0)
	alpha_delta_dir = alpha_delta_dir * -1	
} else if (image_alpha > 0.8) {
	image_alpha = min(image_alpha, 0.8)
	alpha_delta_dir = alpha_delta_dir * -1	
}