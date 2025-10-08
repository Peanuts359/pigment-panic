/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 562F1BA2
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)self.lifetime -= delta_time / 1_000_000$(13_10)$(13_10)if (self.lifetime <= 0) {$(13_10)	instance_destroy();$(13_10)}"
/// @description Execute Code
self.lifetime -= delta_time / 1_000_000

if (self.lifetime <= 0) {
	instance_destroy();
}