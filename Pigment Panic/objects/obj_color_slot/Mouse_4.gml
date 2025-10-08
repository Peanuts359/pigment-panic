/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4E4D1541
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)$(13_10)// if both the current and box colors are blank, do nothing$(13_10)if (global.curr_color == Color.NONE && box_color == Color.NONE) {$(13_10)    exit;$(13_10)}$(13_10)$(13_10)// if exactly one of the current and box colors is blank, swap them$(13_10)if ((global.curr_color == Color.NONE) ^^ (box_color == Color.NONE)) {$(13_10)    var tmp            = global.curr_color;$(13_10)    global.curr_color  = box_color;$(13_10)    box_color          = tmp;$(13_10)	$(13_10)	self.image_index = box_color + 1;$(13_10)	exit;$(13_10)}$(13_10)$(13_10)// otherwise, attempt to mix where possible$(13_10)var a = global.curr_color;$(13_10)var b = box_color;$(13_10)var result = Color.NONE;$(13_10)$(13_10)// primary mixes$(13_10)if (match(a, b, Color.RED, Color.BLUE)) {$(13_10)    result = Color.PURPLE;$(13_10)}$(13_10)else if (match(a, b, Color.RED, Color.YELLOW)) {$(13_10)    result = Color.ORANGE;$(13_10)}$(13_10)else if (match(a, b, Color.BLUE, Color.YELLOW)) {$(13_10)    result = Color.GREEN;$(13_10)}$(13_10)$(13_10)// secondary mixes that result in brown$(13_10)else if (match(a, b, Color.PURPLE, Color.YELLOW)) {$(13_10)    result = Color.BROWN;$(13_10)}$(13_10)else if (match(a, b, Color.ORANGE, Color.BLUE)) {$(13_10)    result = Color.BROWN;$(13_10)}$(13_10)else if (match(a, b, Color.GREEN, Color.RED)) {$(13_10)    result = Color.BROWN;$(13_10)}$(13_10)$(13_10)// apply result if a valid mix happened$(13_10)if (result != Color.NONE) {$(13_10)    box_color = result;$(13_10)    global.curr_color = Color.NONE; // hand used up$(13_10)    image_index = box_color + 1;    // update sprite frame$(13_10)}"
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
	
	self.image_index = box_color + 1;
	exit;
}

// otherwise, attempt to mix where possible
var a = global.curr_color;
var b = box_color;
var result = Color.NONE;

// primary mixes
if (match(a, b, Color.RED, Color.BLUE)) {
    result = Color.PURPLE;
}
else if (match(a, b, Color.RED, Color.YELLOW)) {
    result = Color.ORANGE;
}
else if (match(a, b, Color.BLUE, Color.YELLOW)) {
    result = Color.GREEN;
}

// secondary mixes that result in brown
else if (match(a, b, Color.PURPLE, Color.YELLOW)) {
    result = Color.BROWN;
}
else if (match(a, b, Color.ORANGE, Color.BLUE)) {
    result = Color.BROWN;
}
else if (match(a, b, Color.GREEN, Color.RED)) {
    result = Color.BROWN;
}

// apply result if a valid mix happened
if (result != Color.NONE) {
    box_color = result;
    global.curr_color = Color.NONE; // hand used up
    image_index = box_color + 1;    // update sprite frame
}