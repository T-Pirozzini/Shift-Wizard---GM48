/// @description Insert description here

//Move arrow left and Right & wall collisions
#region
if (global.pOnePointerActive) {	
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
if (global.castingPhase && global.pOneCastingPhase) {
	global.pOnePointerActive = true;	
	if (global.pOnePointerActive) {		
		//Check if pointer touches red element
		if (place_meeting(x, y, oElementRed) && keyboard_check_released(vk_lshift)) {				
			var _index = ds_list_find_index(global.pOneElementList, oElementRed)
			// Cast Red Spell
			instance_create_layer(oPointer1.x + 100, oPointer1.y + 100, "Spells", oRedWand)
			instance_create_layer(oPointer1.x, oPointer1.y + 200, "Spells", oRedInstructions)				
			global.pOneRedSpell = true;						
			//remove element from the list			
			ds_list_delete(global.pOneElementList, _index)
			global.pOnePointerActive = false;
		}
			
		//Check if pointer touches yellow element
		if (place_meeting(x, y, oElementYellow) && keyboard_check_released(vk_lshift)) {			
			var _index = ds_list_find_index(global.pOneElementList, oElementYellow)
			//Cast Yellow Spell
			instance_create_layer(oPointer1.x + 100, oPointer1.y + 100, "Spells", oYellowWand)	
			instance_create_layer(oPointer1.x, oPointer1.y + 200, "Spells", oYellowInstructions)			
			global.pOneYellowSpell = true							
			//remove element from the list			
			ds_list_delete(global.pOneElementList, _index)	
			global.pOnePointerActive = false;
		}		
		
		//Check if pointer touches green element
		if (place_meeting(x, y, oElementGreen) && keyboard_check_released(vk_lshift)) {			
			var _index = ds_list_find_index(global.pOneElementList, oElementGreen)	
			// Cast Green Spell
			instance_create_layer(oPointer1.x + 100, oPointer1.y + 100, "Spells", oGreenWand)
			instance_create_layer(oPointer1.x, oPointer1.y + 200, "Spells", oGreenInstructions)				
			global.pOneGreenSpell = true					
			//remove element from the list			
			ds_list_delete(global.pOneElementList, _index)
			global.pOnePointerActive = false;
		}
		
		// check if pointer touches X
		instance_create_layer(144, 144, "Instances", oNope)
		if (place_meeting(x, y, oNope) && keyboard_check_released(vk_lshift)) {
			global.pOnePointerActive = false;
			global.pOneTurn = false;			 
			global.pOneCastingPhase = false;				 	 
			global.pTwoCastingPhase = true;
			global.pTwoTurn = true;
			instance_destroy(oNope)
		}		
	}
}
		
#endregion

