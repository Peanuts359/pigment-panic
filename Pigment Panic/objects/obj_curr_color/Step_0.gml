/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 03E35E87
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)$(13_10)if (global.curr_color != -1) {$(13_10)	self.image_index = 1$(13_10)	self.image_blend = make_color_rgb($(13_10)							global.Color_rgb[global.curr_color][0], $(13_10)							global.Color_rgb[global.curr_color][1], $(13_10)							global.Color_rgb[global.curr_color][2])$(13_10)	$(13_10)} else {$(13_10)	self.image_index = 0	$(13_10)}"
/// @description Execute Code

if (global.curr_color != -1) {
	self.image_index = 1
	self.image_blend = make_color_rgb(
							global.Color_rgb[global.curr_color][0], 
							global.Color_rgb[global.curr_color][1], 
							global.Color_rgb[global.curr_color][2])
	
} else {
	self.image_index = 0	
}