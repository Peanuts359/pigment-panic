/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4E4D1541
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)if ((global.curr_color == -1) ^^ (box_color == -1)) {$(13_10)    var tmp            = global.curr_color;$(13_10)    global.curr_color  = box_color;$(13_10)    box_color          = tmp;$(13_10)	$(13_10)	self.image_index = box_color + 1;$(13_10)}"
/// @description Execute Code
if ((global.curr_color == -1) ^^ (box_color == -1)) {
    var tmp            = global.curr_color;
    global.curr_color  = box_color;
    box_color          = tmp;
	
	self.image_index = box_color + 1;
}