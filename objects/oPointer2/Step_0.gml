/// @description Insert description here

//Move arrow left and Right & wall collisions
#region
if (global.castingPhase) {	
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
#endregion

//Remove item from ds_list and destroy instance on pointer click
#region
if (global.castingPhase && !global.pOneCastingActive) {
	if (global.pTwoCastingActive) {
		global.pTwoPointerActive = true
		if (global.pTwoPointerActive) {			
		 //check if pointer touches red element
			if (place_meeting(x, y, oElementRed) && keyboard_check_pressed(vk_delete)) {
					var _index = ds_list_find_index(global.pTwoList, "red")
					//remove element from the list
					ds_list_delete(global.pTwoList, _index)
					for (i = 0; i < instance_number(oElementRed); i++) {
					  elementID = instance_find(oElementRed,i);
						//destroy element						
						instance_destroy(elementID);						
				}		
				global.pTwoCastingActive = false;
				global.pTwoPointerActive = false;
				global.pOneMovementActive = true;				
				global.currentRound++				
			}
			if (place_meeting(x, y, oElementYellow) && keyboard_check_pressed(vk_delete)) {
				var _index = ds_list_find_index(global.pTwoList, "yellow")
				//remove element from the list
				ds_list_delete(global.pTwoList, _index)
				for (i = 0; i < instance_number(oElementYellow); i++) {
				  elementID = instance_find(oElementYellow,i);
					//destroy element
					instance_destroy(elementID);						
				}
				global.pTwoCastingActive = false;
				global.pTwoPointerActive = false;
				global.pOneMovementActive = true;				
				global.currentRound++				
			}
			if (place_meeting(x, y, oElementGreen) && keyboard_check_pressed(vk_delete)) {
				var _index = ds_list_find_index(global.pTwoList, "green")
				//remove element from the list
				ds_list_delete(global.pTwoList, _index)
				for (i = 0; i < instance_number(oElementGreen); i++) {
				  elementID = instance_find(oElementGreen,i);
					//destroy element
					instance_destroy(elementID);							
				}
				global.pTwoCastingActive = false;
				global.pTwoPointerActive = false;
				global.pOneMovementActive = true;				
				global.currentRound++				
			}	
		}
	}
}
#endregion










