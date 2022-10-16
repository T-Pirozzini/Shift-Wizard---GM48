/// @description Insert description here

//Move arrow left and Right & wall collisions
#region
if (global.castingPhase) {	
	if (keyboard_check_released(ord("D"))) {
		if (!place_meeting(x + 5, y, oWall)) {
			x += 20			
		}
	}
	if (keyboard_check_released(ord("A"))) {
		if (!place_meeting(x - 5, y, oWall)) {
		x -= 20		
		}
	}
}
#endregion

//Remove item from ds_list and destroy instance on pointer click
#region
//Initiate casting phase - check if both players have no movement
if (global.castingPhase) {	
		if (global.pOneCastingActive) {			
			if (global.pOnePointerActive) {
				//Check if pointer touches red element
				if (place_meeting(x, y, oElementRed) && keyboard_check_released(ord("1"))) {					
					var _index = ds_list_find_index(global.pOneList, "red")
					
					// Cast Red Spell
					instance_create_layer(oPointer1.x + 100, oPointer1.y, "Spells", oRedWand)
					global.pOneRedSpell = true;
					global.pOnePointerActive = false;
					global.pOneCastingActive = false;
					
					//remove element from the list
					ds_list_delete(global.pOneList, _index)
					for (i = 0; i < instance_number(oElementRed); i++) {
					  elementID = instance_find(oElementRed,i);
						//destroy element
						instance_destroy(elementID);						
					}
					global.pOnePointerActive = false;
					global.pOneCastingActive = false;
					global.pTwoCastingActive = true;
					global.pTwoPointerActive = true;
				}
				//Check if pointer touches yellow element
				if (place_meeting(x, y, oElementYellow) && keyboard_check_released(ord("1"))) {
					var _index = ds_list_find_index(global.pOneList, "yellow")
					
					//Cast Yellow Spell
					instance_create_layer(oPointer1.x, oPointer1.y, "Spells", oYellowWand)					
					global.pOneYellowSpell = true;
					global.pOnePointerActive = false;
					global.pOneCastingActive = false;
					
					//remove element from the list
					ds_list_delete(global.pOneList, _index)
					for (i = 0; i < instance_number(oElementYellow); i++) {
					  elementID = instance_find(oElementYellow,i);
						//destroy element
						instance_destroy(elementID);						
					}					
				}
			}
		}
			//Check if pointer touches green element
			if (place_meeting(x, y, oElementGreen) && keyboard_check_released(ord("1"))) {
				var _index = ds_list_find_index(global.pOneList, "green")
				
				// Cast Green Spell
					instance_create_layer(oPointer1.x, oPointer1.y, "Spells", oGreenWand)
					global.pOneGreenSpell = true;
					global.pOnePointerActive = false;
					global.pOneCastingActive = false;
					
				//remove element from the list
				ds_list_delete(global.pOneList, _index)
				for (i = 0; i < instance_number(oElementGreen); i++) {
				  elementID = instance_find(oElementGreen,i);
					//destroy element
					instance_destroy(elementID);							
				}	
				if (!global.pOneGreenSpell && !global.pOneRedSpell) {
				global.pOnePointerActive = false;
				global.pOneCastingActive = false;
				global.pTwoCastingActive = true;
				global.pTwoPointerActive = true;
				}
			}	
		}	
#endregion









