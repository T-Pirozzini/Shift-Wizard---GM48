function dealCards () {
// get deck size
var _deckSize = ds_list_size(cardDeck);
// set each rows y-position
var _y5 = 50
var _y4 = 50
var _y3 = 50
var _y2 = 50
var _y1 = 50

	for (var i = 0; i < _deckSize; i++) {	
		var _xAdjustment = 100;
		// set row 5
		if (i < 5) {
			 instance_create_layer(750 + _xAdjustment, _y5, "Cards", ds_list_find_value(cardDeck, i))
			_y5 += 125;		
		};
		// set row 4
		if (i <= 10 && i > 5) {
			 instance_create_layer(625 + _xAdjustment, _y4, "Cards", ds_list_find_value(cardDeck, i))
			_y4 += 125;
		};
		// set row 3
		if (i <= 15 && i > 10) {
			 instance_create_layer(500 + _xAdjustment, _y3, "Cards", ds_list_find_value(cardDeck, i))
			_y3 += 125;
		};
		// set row 2
		if (i <= 20 && i > 15) {
			 instance_create_layer(375 + _xAdjustment, _y2, "Cards", ds_list_find_value(cardDeck, i))
			_y2 += 125;
		};
		// set row 1
		if (i <= 25 && i > 20) {
			 instance_create_layer(250 + _xAdjustment, _y1, "Cards", ds_list_find_value(cardDeck, i))
			_y1 += 125;
		};
	};
};
