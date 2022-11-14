/// @description Insert description here

if (global.pOneRedSpell) {
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
		 global.pOneRedSpell = false;
		 global.pOneCastingActive = false;
		 global.currentlyCasting = false;		 
		 global.pTwoCastingActive = true;
		}
	}
		
}


if (global.pTwoRedSpell) {
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
			global.pTwoRedSpell = false;
			global.pTwoCastingActive = false;
			global.currentlyCasting = false;			
			global.pOneTurn = true;
		}
	}
}

