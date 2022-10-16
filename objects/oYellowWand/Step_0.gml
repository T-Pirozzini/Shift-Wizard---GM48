/// @description Insert description here

if (global.pOneCastingActive) {
	if (keyboard_check(ord("D"))) {		
			x += 0	
		}
		if (keyboard_check(ord("A"))) {		
			x -= 0			
		}
		if (keyboard_check(ord("S"))) {		
			y += 0		
		}
		if (keyboard_check(ord("W"))) {		
			y -= 0				
		}
	}

	//Yellow spell movement
	// up-right	
	if (keyboard_check_released(ord("W")) && keyboard_check_released(ord("D"))) {
		if(!place_meeting(oPlayer1.x + 60, oPlayer1.y - 60, oWall)) {
		oPlayer1.x += 60
		oPlayer1.y -= 60
		global.pOneYellowSpell = false;
		instance_destroy(oYellowWand)
		global.pTwoCastingActive = true;
		global.pTwoPointerActive = true;	
	}
	}
	// up-left
	if (keyboard_check_released(ord("W")) && keyboard_check_released(ord("A"))) {
		if(!place_meeting(oPlayer1.x - 60, oPlayer1.y - 60, oWall)) {
		oPlayer1.x -= 60
		oPlayer1.y -= 60
		global.pOneYellowSpell = false;
		instance_destroy(oYellowWand)
		global.pTwoCastingActive = true;
		global.pTwoPointerActive = true;
	}
	}
	//down-right
	if (keyboard_check_pressed(ord("S")) && keyboard_check_pressed(ord("D"))) {
		if(!place_meeting(oPlayer1.x + 60, oPlayer1.y + 60, oWall)) {
		oPlayer1.x += 60
		oPlayer1.y += 60
		global.pOneYellowSpell = false;
		instance_destroy(oYellowWand)
		global.pTwoCastingActive = true;
		global.pTwoPointerActive = true;					
	}
	}
	//down-left
	if (keyboard_check_pressed(ord("S")) && keyboard_check_pressed(ord("A"))) {
		if(!place_meeting(oPlayer1.x - 60, oPlayer1.y + 60, oWall)) {
		oPlayer1.x -= 60
		oPlayer1.y += 60
		global.pOneYellowSpell = false;
		instance_destroy(oYellowWand)
		global.pTwoCastingActive = true;
		global.pTwoPointerActive = true;
		}
	}

