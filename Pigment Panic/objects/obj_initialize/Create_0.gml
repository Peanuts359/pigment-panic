
function ColorMix(_value, _mixing_array) constructor {
	value = _value;
	mixing_array = _mixing_array;
	mix_result = function(other_color) {
		return mixing_array[other_color]	
	}
}

global.mix_table = [
	new ColorMix(Color.RED, 
		 // Basic colors
		[-1, Color.PURPLE, Color.ORANGE, Color.D_RED, Color.L_RED,
		 // Secondaries
		 -1, Color.BROWN, -1, -1, -1,
		 // Tinted Primaries
		 -1, -1, Color.D_PURPLE, Color.L_PURPLE, Color.D_ORANGE, Color.L_ORANGE,
		 // Tinted Secondaries
		 -1, -1, Color.D_BROWN, Color.L_BROWN, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.BLUE,
		[Color.PURPLE, -1, Color.GREEN, Color.D_BLUE, Color.L_BLUE,
		 -1, -1, Color.BROWN, -1, -1,
		 Color.D_PURPLE, Color.L_PURPLE, -1, -1, Color.D_GREEN, Color.L_GREEN,
		 -1, -1, -1, -1, Color.D_BROWN, Color.L_BROWN, -1, -1, -1, -1]
	),
	new ColorMix(Color.YELLOW,
		[Color.ORANGE, Color.GREEN, -1, Color.D_YELLOW, Color.L_YELLOW,
		 Color.BROWN, -1, -1, -1, -1,
		 Color.D_ORANGE, Color.L_ORANGE, Color.D_GREEN, Color.L_GREEN, -1, -1,
		 Color.D_BROWN, Color.L_BROWN, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.BLACK,
		[Color.D_RED, Color.D_BLUE, Color.D_YELLOW, -1, Color.GRAY,
		 Color.D_PURPLE, Color.D_GREEN, Color.D_ORANGE, Color.D_BROWN, Color.D_GRAY,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.WHITE,
		[Color.L_RED, Color.L_BLUE, Color.L_YELLOW, Color.GRAY, -1,
		 Color.L_PURPLE, Color.L_GREEN, Color.L_ORANGE, Color.L_BROWN, Color.L_GRAY,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.PURPLE,
		[-1, -1, Color.BROWN, Color.D_PURPLE, Color.L_PURPLE,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, Color.D_BROWN, Color.L_BROWN,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.GREEN,
		[Color.BROWN, -1, -1, Color.D_GREEN, Color.L_GREEN,
		 -1, -1, -1, -1, -1,
		 Color.D_BROWN, Color.L_BROWN, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.ORANGE,
		[-1, Color.BROWN, -1, Color.D_ORANGE, Color.L_ORANGE,
		 -1, -1, -1, -1, -1,
		 -1, -1, Color.D_BROWN, Color.L_BROWN, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.BROWN,
		[-1, -1, -1, Color.D_BROWN, Color.L_BROWN,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.GRAY,
		[-1, -1, -1, Color.D_GRAY, Color.L_GRAY,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_RED,
		[-1, Color.D_PURPLE, Color.D_ORANGE, -1, -1,
		 -1, Color.D_BROWN, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_RED,
		[-1, Color.L_PURPLE, Color.L_ORANGE, -1, -1,
		 -1, Color.L_BROWN, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_BLUE,
		[Color.D_PURPLE, -1, Color.D_GREEN, -1, -1,
		 -1, -1, Color.D_BROWN, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_BLUE,
		[Color.L_PURPLE, -1, Color.L_GREEN, -1, -1,
		 -1, -1, Color.L_BROWN, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_YELLOW,
		[Color.D_ORANGE, Color.D_GREEN, -1, -1, -1,
		 Color.D_BROWN, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_YELLOW,
		[Color.L_ORANGE, Color.L_GREEN, -1, -1, -1,
		 Color.L_BROWN, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_PURPLE,
		[-1, -1, Color.D_BROWN, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_PURPLE,
		[-1, -1, Color.L_BROWN, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_GREEN,
		[Color.D_BROWN, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_GREEN,
		[Color.L_BROWN, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_ORANGE,
		[-1, Color.D_BROWN, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_ORANGE,
		[-1, Color.L_BROWN, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_BROWN,
		[-1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_BROWN,
		[-1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.D_GRAY,
		[-1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
	new ColorMix(Color.L_GRAY,
		[-1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1,
		 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
	),
]

global.Color_rgb = [[255, 0, 0], [0, 0, 255], [255, 255, 0], [35, 35, 35], [255, 255, 255],
		 [255, 0, 255], [0, 255, 0], [255, 101, 0], [169, 101, 24], [128, 128, 128],
		 [164, 0, 0], [255, 119, 119], [1, 1, 113], [181, 181, 253], [160, 160, 0], [255, 255, 160],
		 [123, 1, 123], [255, 167, 255], [0, 130, 0], [135, 251, 135], [190, 83, 0], [249, 150, 72],
		 [113, 63, 8], [225, 177, 125], [64, 64, 64], [192, 192, 192]]
global.fills = [spr_fill, spr_fill_watercolor]

instance_destroy()