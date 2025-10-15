/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4E4D1541
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)$(13_10)// if both the current and box colors are blank, do nothing$(13_10)if (global.curr_color == Color.NONE && box_color == Color.NONE) {$(13_10)    exit;$(13_10)}$(13_10)$(13_10)// if exactly one of the current and box colors is blank, swap them$(13_10)if ((global.curr_color == Color.NONE) ^^ (box_color == Color.NONE)) {$(13_10)    var tmp            = global.curr_color;$(13_10)    global.curr_color  = box_color;$(13_10)    box_color          = tmp;$(13_10)	$(13_10)	if (box_color != Color.NONE) {$(13_10)		self.image_index = 5$(13_10)		self.image_blend = make_color_rgb(global.Color_rgb[box_color][0], $(13_10)							global.Color_rgb[box_color][1], $(13_10)							global.Color_rgb[box_color][2])$(13_10)	} else {$(13_10)		self.image_index = 0	$(13_10)	}$(13_10)	exit;$(13_10)}$(13_10)$(13_10)// otherwise, attempt to mix where possible$(13_10)var a = global.curr_color;$(13_10)var b = box_color;$(13_10)$(13_10)var result = global.mix_table[a].mix_result(b)$(13_10)$(13_10)// apply result if a valid mix happened$(13_10)if (result != Color.NONE) {$(13_10)    box_color = result;$(13_10)    global.curr_color = Color.NONE; // hand used up$(13_10)    self.image_index = 5$(13_10)	self.image_blend = make_color_rgb(global.Color_rgb[box_color][0], $(13_10)							global.Color_rgb[box_color][1], $(13_10)							global.Color_rgb[box_color][2])$(13_10)}"
/// @description Execute Code

// if both the current and box colors are blank, do nothing
if (global.curr_color == Color.NONE && box_color == Color.NONE) {
    exit;
}

// if exactly one of the current and box colors is blank, swap them
if ((global.curr_color == Color.NONE) ^^ (box_color == Color.NONE)) {
    var tmp            = global.curr_color;
    global.curr_color  = box_color;
    box_color          = tmp;
	
	if (box_color != Color.NONE) {
		self.image_index = 5
		self.image_blend = make_color_rgb(global.Color_rgb[box_color][0], 
							global.Color_rgb[box_color][1], 
							global.Color_rgb[box_color][2])
	} else {
		self.image_index = 0	
	}
	exit;
}

// otherwise, attempt to mix where possible
var a = global.curr_color;
var b = box_color;

var result = global.mix_table[a].mix_result(b)

// apply result if a valid mix happened
if (result != Color.NONE) {
    box_color = result;
    global.curr_color = Color.NONE; // hand used up
    self.image_index = 5
	self.image_blend = make_color_rgb(global.Color_rgb[box_color][0], 
							global.Color_rgb[box_color][1], 
							global.Color_rgb[box_color][2])
}