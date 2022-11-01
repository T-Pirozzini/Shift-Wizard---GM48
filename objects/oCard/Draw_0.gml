/// @description Insert description here

// Deal deck to create dynamic game board
var _deckSize = ds_list_size(deck);
var _y5 = 50
var _y4 = 50
var _y3 = 50
var _y2 = 50
var _y1 = 50

for (var i = 0; i < _deckSize; i++) {	
 if (i < 5) {
	draw_sprite(ds_list_find_value(deck, i), image_index, 750, _y5)
	_y5 += 125;		
}
if (i <= 10 && i > 5) {
	draw_sprite(ds_list_find_value(deck, i), image_index, 625, _y4)
	_y4 += 125;
}
if (i <= 15 && i > 10) {
	draw_sprite(ds_list_find_value(deck, i), image_index, 500, _y3)
	_y3 += 125;
}
if (i <= 20 && i > 15) {
	draw_sprite(ds_list_find_value(deck, i), image_index, 375, _y2)
	_y2 += 125;
}
if (i <= 25 && i > 20) {
	draw_sprite(ds_list_find_value(deck, i), image_index, 250, _y1)
	_y1 += 125;
}
}


//for (var i = 0; i < 5; i++) {	
//	draw_sprite(ds_list_find_value(deck, i), image_index, 625, _y4)
//	_y4 += 125
//}
//for (var i = 0; i < 5; i++) {	
//	draw_sprite(ds_list_find_value(deck, i), image_index, 500, _y3)
//	_y3 += 125
//}
//for (var i = 0; i < 5; i++) {	
//	draw_sprite(ds_list_find_value(deck, i), image_index, 375, _y2)
//	_y2 += 125
//}
//for (var i = 0; i < 5; i++) {	
//	draw_sprite(ds_list_find_value(deck, i), image_index, 250, _y1)
//	_y1 += 125
//}

	//if (i <= 10) {
	//	draw_sprite(ds_list_find_value(deck, i + 5), image_index, 625, _yPos)
	//	_yPos4 += 125;		
	//}
	//if (i <= 15) {
	//	draw_sprite(ds_list_find_value(deck, i + 10), image_index, 500, _yPos)
	//	_yPos3 += 125;		
	//}
	//if (i <= 20) {
	//	draw_sprite(ds_list_find_value(deck, i + 15), image_index, 375, _yPos)
	//	_yPos2 += 125;		
	//}
	//if (i <= 25) {
	//	draw_sprite(ds_list_find_value(deck, i + 20), image_index, 250, _yPos)
	//	_yPos1 += 125;		
	//}

