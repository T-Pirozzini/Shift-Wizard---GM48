/// @description Insert description here

draw_text(x, y, "Player Two");
draw_text(x - 25, y + 25, "Spell Components");

var _elements = global.pTwoElements
if (array_length(_elements) <= 0) {
	draw_text(x, y + 50, "No Elements");
} else {
	elementPosition = 0
	for (i = 0; i < array_length(_elements); i++) {
		if (_elements[i] == "red") {
			draw_sprite(sElementRed, image_index, x + elementPosition, y + 50);
		}
		if (_elements[i] == "yellow") {
			draw_sprite(sElementYellow, image_index, x + elementPosition, y + 50);
		}
		if (_elements[i] == "green") {
			draw_sprite(sElementGreen, image_index, x + elementPosition, y + 50);
		}		
		elementPosition += 20
	}
}


if (array_length(global.pTwoElements) == 5) {
	draw_text_transformed(x, y + 75, "Spell Bag Full", .75, .75, 1);	
}

//if (global.pTwoPointer) {
//	draw_sprite(sPointer, 0, x, y + 75)
//}