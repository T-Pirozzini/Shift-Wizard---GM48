// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function dealCards () {
var _deckSize = ds_list_size(cardDeck);
var _y5 = 50
var _y4 = 50
var _y3 = 50
var _y2 = 50
var _y1 = 50

for (var i = 0; i < _deckSize; i++) {	
 if (i < 5) {
	 instance_create_layer(750, _y5, "Cards", ds_list_find_value(objDeck, i))
	//draw_sprite(ds_list_find_value(cardDeck, i), image_index, 750, _y5)
	_y5 += 125;		
}
if (i <= 10 && i > 5) {
	 instance_create_layer(625, _y4, "Cards", ds_list_find_value(objDeck, i))
	//draw_sprite(ds_list_find_value(cardDeck, i), image_index, 625, _y4)
	_y4 += 125;
}
if (i <= 15 && i > 10) {
	 instance_create_layer(500, _y3, "Cards", ds_list_find_value(objDeck, i))
	//draw_sprite(ds_list_find_value(cardDeck, i), image_index, 500, _y3)
	_y3 += 125;
}
if (i <= 20 && i > 15) {
	 instance_create_layer(375, _y2, "Cards", ds_list_find_value(objDeck, i))
	//draw_sprite(ds_list_find_value(cardDeck, i), image_index, 375, _y2)
	_y2 += 125;
}
if (i <= 25 && i > 20) {
	 instance_create_layer(250, _y1, "Cards", ds_list_find_value(objDeck, i))
	//draw_sprite(ds_list_find_value(cardDeck, i), image_index, 250, _y1)
	_y1 += 125;
}
}
}
