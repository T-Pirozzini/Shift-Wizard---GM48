/// @description Insert description here

//Move arrow left and Right & wall collisions
#region
if (global.pTwoPointerActive) {	
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
if (global.castingPhase && global.pTwoCastingPhase) {
		global.pTwoPointerActive = true;
	if (global.pTwoPointerActive) {			
			
		//check if pointer touches red element
		if (place_meeting(x, y, oElementRed) && keyboard_check_pressed(vk_numpad0)) {
				var _index = ds_list_find_index(global.pTwoList, "red")
				//remove element from the list
				ds_list_delete(global.pTwoList, _index)
					
				// Cast Red Spell
				with (instance_create_layer(oPointer2.x, oPointer2.y, "Spells", oRedWand)) {
				image_xscale = -1
				}
				instance_create_layer(oPointer2.x, oPointer2.y + 100, "Spells", oRedInstructions)
				global.currentlyCasting = true;					
				global.pTwoRedSpell = true;					
					
				for (i = 0; i < instance_number(oElementRed); i++) {
					elementID = instance_find(oElementRed,i);
					//destroy element						
					instance_destroy(elementID);						
			}				
			global.currentRound++				
		}
		if (place_meeting(x, y, oElementYellow) && keyboard_check_pressed(vk_numpad0)) {
			var _index = ds_list_find_index(global.pTwoList, "yellow")
				
			//Cast Yellow Spell
				with (instance_create_layer(oPointer2.x + 100, oPointer2.y, "Spells", oYellowWand)) {
					image_xscale = -1
				}
				instance_create_layer(oPointer2.x, oPointer2.y + 100, "Spells", oYellowInstructions)
				global.currentlyCasting = true;					
				global.pTwoYellowSpell = true;
					
			//remove element from the list
			ds_list_delete(global.pTwoList, _index)
			for (i = 0; i < instance_number(oElementYellow); i++) {
				elementID = instance_find(oElementYellow,i);
				//destroy element
				instance_destroy(elementID);						
			}							
			global.currentRound++				
		}
			
		//Check if pointer touches green element
		if (place_meeting(x, y, oElementGreen) && keyboard_check_pressed(vk_numpad0)) {
			var _index = ds_list_find_index(global.pTwoList, "green")
				
			// Cast Green Spell
				with (instance_create_layer(oPointer2.x + 100, oPointer2.y, "Spells", oGreenWand)) {
					image_xscale = -1
				}
				instance_create_layer(oPointer2.x, oPointer2.y + 100, "Spells", oGreenInstructions)
				global.currentlyCasting = true;					
				global.pTwoGreenSpell = true;
					
			//remove element from the list
			ds_list_delete(global.pTwoList, _index)
			for (i = 0; i < instance_number(oElementGreen); i++) {
				elementID = instance_find(oElementGreen,i);
				//destroy element
				instance_destroy(elementID);							
			}				
			global.currentRound++				
		}
	}
}
#endregion










