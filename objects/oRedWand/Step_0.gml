/// @description Insert description here

if (global.pOneRedSpell) {

// Player One
	if (keyboard_check(ord("D"))) {		
		x += 2	
	}
	if (keyboard_check(ord("A"))) {		
		x -= 2			
	}
	if (keyboard_check(ord("S"))) {		
		y += 2		
	}
	if (keyboard_check(ord("W"))) {		
		y -= 2				
	}
	
	if (place_meeting(x,y, oCard)){
		if (keyboard_check(vk_lshift)) {
		var _cardID = instance_position(x, y, oCard)
		 instance_destroy(_cardID)
		 global.pOneRedSpell = false
		 instance_destroy(oRedWand)
		}
	}
	//global.pOneRedSpell = false;
	//global.pTwoCastingActive = true;
	//global.pTwoPointerActive = true;
}


if (global.pTwoRedSpell) {

// Player Two
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
	
	if (place_meeting(x,y, oCard)){
		if (keyboard_check(vk_numpad0)) {
			var _cardID = instance_position(x, y, oCard)
			instance_destroy(_cardID)
			global.pTwoRedSpell = false
			instance_destroy(oRedWand)	 	 
			global.pOneMovementActive = true;
		}
	}
}

