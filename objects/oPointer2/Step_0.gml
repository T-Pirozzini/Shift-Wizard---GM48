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
				//var _index = ds_list_find_index(global.pTwoElementList, "red")
				var _index = ds_list_find_index(global.pTwoElementList, oElementRed)				
					
				// Cast Red Spell
				with (instance_create_layer(oPointer2.x, oPointer2.y, "Spells", oRedWand)) {
				image_xscale = -1
				}
				instance_create_layer(oPointer2.x, oPointer2.y + 100, "Spells", oRedInstructions)				
				global.pTwoRedSpell = true;					
					
				ds_list_delete(global.pTwoElementList, _index)
				var _inst = instance_position(x, y, oElementRed)
				instance_destroy(_inst)
				//for (var i = 0; i < instance_number(oElementRed); i++) {
				//	p2ElementID = instance_find(oElementRed,i);
				//	//destroy element
				//	instance_destroy(p2ElementID);						
				//}		
			global.currentRound++				
		}
		if (place_meeting(x, y, oElementYellow) && keyboard_check_pressed(vk_numpad0)) {
			//var _index = ds_list_find_index(global.pTwoElementList, "yellow")
			var _index = ds_list_find_index(global.pTwoElementList, oElementYellow)
				
			//Cast Yellow Spell
				with (instance_create_layer(oPointer2.x + 100, oPointer2.y, "Spells", oYellowWand)) {
					image_xscale = -1
				}
				instance_create_layer(oPointer2.x, oPointer2.y + 100, "Spells", oYellowInstructions)				
				global.pTwoYellowSpell = true;
					
			//remove element from the list
			ds_list_delete(global.pTwoElementList, _index)
			var _inst = instance_position(x, y, oElementYellow)
			instance_destroy(_inst)
			//for (i = 0; i < instance_number(oElementYellow); i++) {
			//	p2ElementID = instance_find(oElementYellow,i);
			//	//destroy element
			//	instance_destroy(p2ElementID);						
			//}							
			global.currentRound++				
		}
			
		//Check if pointer touches green element
		if (place_meeting(x, y, oElementGreen) && keyboard_check_released(vk_numpad0)) {
			//var _index = ds_list_find_index(global.pTwoElementList, "green")
			var _index = ds_list_find_index(global.pTwoElementList, oElementGreen)
				
			// Cast Green Spell
				with (instance_create_layer(oPointer2.x + 100, oPointer2.y, "Spells", oGreenWand)) {
					image_xscale = -1
				}
				instance_create_layer(oPointer2.x, oPointer2.y + 100, "Spells", oGreenInstructions)				
				global.pTwoGreenSpell = true;
					
			//remove element from the list
			ds_list_delete(global.pTwoElementList, _index)
			var _inst = instance_position(x, y, oElementGreen)
			instance_destroy(_inst)
			//for (i = 0; i < instance_number(oElementGreen); i++) {
			//	p2ElementID = instance_find(oElementGreen,i);
			//	//destroy element
			//	instance_destroy(p2ElementID);							
			//}				
			global.currentRound++				
		}
	}
}
#endregion










