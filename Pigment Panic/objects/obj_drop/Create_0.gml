/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2502843B
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)self.image_speed = 0;$(13_10)self.image_index = global.drop_colors[$(13_10)	irandom(array_length(global.drop_colors) - 1)$(13_10)];$(13_10)drop_color = self.image_index;$(13_10)$(13_10)self.lifetime = 2;$(13_10)"
/// @description Execute Code
self.image_speed = 0;
self.image_index = global.drop_colors[
	irandom(array_length(global.drop_colors) - 1)
];
drop_color = self.image_index;

self.lifetime = 2;