/// @description Insert description here

if (global.pOneRedSpell) {
	global.pOnePointerActive = false;
// Player One staff movement
#region
	if (keyboard_check(ord("D"))) {		
		x += 5	
	}
	if (keyboard_check(ord("A"))) {		
		x -= 5			
	}
	if (keyboard_check(ord("S"))) {		
		y += 5		
	}
	if (keyboard_check(ord("W"))) {		
		y -= 5				
	}
#endregion

	for (var i = 0; i < instance_number(oGameBoard); i++) {		
		card[i] = instance_find(oGameBoard, i);
		card[i].image_alpha = 1
		card[i].image_speed = 1			
			
		//check for player 1 current tile			
		if (place_meeting(oPlayer1.x, oPlayer1.y, card[i])) {
			card[i].image_speed = 0
			card[i].image_alpha = .4				
		}
		// check for player 2 current tile			
		if (place_meeting(oPlayer2.x, oPlayer2.y, card[i])) {
			card[i].image_speed = 0
			card[i].image_alpha = .4			
		}
		// check for point			
		if (place_meeting(oPoint.x, oPoint.y, card[i])) {
			card[i].image_speed = 0
			card[i].image_alpha = .4			
		}	
	} 
	 
	if (place_meeting(x, y, oGameBoard)){
		if (keyboard_check(vk_lshift)) {
		var _inst = instance_position(x, y, oGameBoard)
			if (_inst.image_speed == 1) {
			 instance_destroy(_inst)		 
			 instance_destroy(oRedWand)
			 instance_destroy(oRedInstructions)
			 global.pOneTurn = false;
			 global.pOneRedSpell = false;		 
			 global.pOneCastingPhase = false;				 	 
			 global.pTwoCastingPhase = true;
			 global.pTwoTurn = true;	
			}
		}
	}		
}


if (global.pTwoRedSpell) {
	global.pTwoPointerActive = false;
// Player Two staff movement
#region
	if (keyboard_check(vk_right)) {		
		x += 2	
	}
	if (keyboard_check(vk_left)) {		
		x -= 2			
	}
	if (keyboard_check(vk_down)) {		
		y += 2		
	}
	if (keyboard_check(vk_up)) {		
		y -= 2				
	}
#endregion
	
	for (var i = 0; i < instance_number(oGameBoard); i++) {		
		card[i] = instance_find(oGameBoard, i);
		card[i].image_alpha = 1
		card[i].image_speed = 1			
			
		// check for player 1 current tile			
		if (place_meeting(oPlayer1.x, oPlayer1.y, card[i])) {
			card[i].image_speed = 0
			card[i].image_alpha = .4				
		}
		// check for player 2 current tile			
		if (place_meeting(oPlayer2.x, oPlayer2.y, card[i])) {
			card[i].image_speed = 0
			card[i].image_alpha = .4			
		}	
		// check for point
		if (place_meeting(oPoint.x, oPoint.y, card[i])) {
			card[i].image_speed = 0
			card[i].image_alpha = .4			
		}	
	}
	
	if (place_meeting(x, y, oGameBoard)){
		if (keyboard_check(vk_numpad0)) {
			var _inst = instance_position(x, y, oGameBoard)
			if (_inst.image_speed == 1) {
				instance_destroy(_inst)			
				instance_destroy(oRedWand)
				instance_destroy(oRedInstructions)
				global.pTwoTurn = false
				global.pTwoRedSpell = false;			
				global.pTwoCastingPhase = false;									
				global.pOneTurn = true;
				global.collectionPhase = true;
				global.pOneCollectionPhase = true;
				global.castingPhase = false;
			}
		}
	}
}

