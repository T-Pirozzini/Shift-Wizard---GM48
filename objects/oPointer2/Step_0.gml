/// @description Insert description here

//Move arrow left and Right

if (global.pTwoCastingActive) {	
	if (keyboard_check_released(vk_right)) {
		if (!place_meeting(x + 5, y, oWall)) {
			x += 20
		}
	}
	if (keyboard_check_released(vk_left)) {
		if (!place_meeting(x - 5, y, oWall)) {
		x -= 20
		}
	}
}


//Collisions




