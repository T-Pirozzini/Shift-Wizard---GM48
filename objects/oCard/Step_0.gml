/// @description Insert description here

// dynamically add shuffled game board
dealCards();


//Handle Animation

	// set card animation to false for all current cards
	if (!animate) {
		for (var i = 0; i < deckSize; i++) {
			var _inst = ds_list_find_value(cardDeck, i)
			_inst.image_speed = 0;
		};
	};
	
	
	

	
	if (global.selectionPhase) {
		for (var i = 0; i <= deckSize; i++) {
			// loop through all cards in card deck and find the card objects instance id
			var _currentCard = ds_list_find_value(cardDeck, i)	
			if (place_meeting(x,y,oPerimeter)) {
				image_speed = 1;
			}
		}
	}
	
					
	//		// get index of currentCard
	//		var _actualCurrentCard = instance_id_get(_currentCard[i])
						
	//		if (i == 0 ) {
	//			_actualCurrentCard.image_speed = 1
	//		}
	//	}
	//}
			
			
				
			
	//		// loop through cardDeck and find each card 
	//		var _redCard = ds_list_find_index(cardDeck, "oRed")
	//		var _yellowCard = ds_list_find_index(cardDeck, oYellow)
	//		var _greenCard = ds_list_find_index(cardDeck, oYellow)
	//		// if current card index is divisible by 1 or 5, animate card
	//		if (_redCard == i) {
	//			_redCard.image_speed = 1;
	//			// find the instance ID of each card object
	//			//var _cardID = instance_find(_cardObj, i)
	//			//_cardID.image_speed = 1; 
	//		};
	//			if (_greenCard / i == 0 ) {
	//			_greenCard.image_speed = 1;
	//			// find the instance ID of each card object
	//			//var _cardID = instance_find(_cardObj, i)
	//			//_cardID.image_speed = 1; 
	//		};
	//			if (_yellowCard / i == 0 ) {
	//			_yellowCard.image_speed = 1;
	//			// find the instance ID of each card object
	//			//var _cardID = instance_find(_cardObj, i)
	//			//_cardID.image_speed = 1; 
	//		};
	//		//animate = true;
	//	};
	//};

	if (animate) {
		for (var i = 0; i < deckSize; i++) {
			var _inst = ds_list_find_value(cardDeck, i)
			_inst.image_speed = 1;
		};		
	};
	
	