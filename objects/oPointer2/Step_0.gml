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
//Initiate casting phase - check if both players have no movement
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
				
				//Cast Yellow Spell
					with (instance_create_layer(oPointer2.x + 100, oPointer2.y, "Spells", oYellowWand)) {
						image_xscale = -1
					}
					
					global.pTwoYellowSpell = true;
					global.pTwoPointerActive = false;
					global.pTwoCastingActive = false;
					
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
			//Check if pointer touches green element
			if (place_meeting(x, y, oElementGreen) && keyboard_check_pressed(vk_delete)) {
				var _index = ds_list_find_index(global.pTwoList, "green")
				
				// Cast Green Spell
					with (instance_create_layer(oPointer2.x + 100, oPointer2.y, "Spells", oGreenWand)) {
						image_xscale = -1
					}
					global.pTwoGreenSpell = true;
					global.pTwoPointerActive = false;
					global.pTwoCastingActive = false;
					
				//remove element from the list
				ds_list_delete(global.pTwoList, _index)
				for (i = 0; i < instance_number(oElementGreen); i++) {
				  elementID = instance_find(oElementGreen,i);
					//destroy element
					instance_destroy(elementID);							
				}
				if (!global.pTwoGreenSpell) {
				global.pTwoCastingActive = false;
				global.pTwoPointerActive = false;
				global.pOneMovementActive = true;
				global.castingPhase = false;
				global.currentRound++				
			}	
			}
		}
	}
}
#endregion










