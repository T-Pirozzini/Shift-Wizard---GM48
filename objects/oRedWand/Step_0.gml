/// @description Insert description here

if (global.pOneRedSpell) {
	global.pOnePointerActive = false;
// Player One staff movement
#region
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
#endregion
	 
	if (place_meeting(x, y, oGameBoard)){
		if (keyboard_check(vk_lshift)) {
		var _inst = instance_position(x, y, oGameBoard)
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
	
	if (place_meeting(x, y, oGameBoard)){
		if (keyboard_check(vk_numpad0)) {
			var _inst = instance_position(x, y, oGameBoard)
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

