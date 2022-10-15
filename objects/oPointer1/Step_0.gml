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
//#region
////Initiate casting phase - check if both players have no movement
//if (!global.pOneMovementActive && !global.pTwoMovementActive && !global.pTwoCastingTurn) {
//	global.pOneCastingTurn = true;
//	if (global.pOneCastingTurn) {
//		global.pOnePointer = true;
//		if (global.pOnePointer) {
//			//Check if pointer touches red element
//			if (place_meeting(x, y, oElementRed) && keyboard_check_pressed(ord("1"))) {
//				var _index = ds_list_find_index(global.pOneList, "red")
//				//remove element from the list
//				ds_list_delete(global.pOneList, _index)
//				for (i = 0; i < instance_number(oElementRed); i++) {
//				  elementID = instance_find(oElementRed,i);
//					//destroy element
//					instance_destroy(elementID);
//					//destroy pointer after selection
//					instance_destroy(self)
//				}
//				global.pOnePointer = false;
//				global.pOneCastingTurn = false;
//				global.pTwoCastingTurn = true;
//			}
//			//Check if pointer touches yellow element
//			if (place_meeting(x, y, oElementYellow) && keyboard_check_pressed(ord("1"))) {
//				var _index = ds_list_find_index(global.pOneList, "yellow")
//				//remove element from the list
//				ds_list_delete(global.pOneList, _index)
//				for (i = 0; i < instance_number(oElementYellow); i++) {
//				  elementID = instance_find(oElementYellow,i);
//					//destroy element
//					instance_destroy(elementID);
//					//destroy pointer after selection
//					instance_destroy(self)
//				}		
//			global.pOnePointer = false;
//			global.pOneCastingTurn = false;
//			global.pTwoCastingTurn = true;
//		}
//		//Check in pointer touches green element
//		if (place_meeting(x, y, oElementGreen) && keyboard_check_pressed(ord("1"))) {
//			var _index = ds_list_find_index(global.pOneList, "green")
//			//remove element from the list
//			ds_list_delete(global.pOneList, _index)
//			for (i = 0; i < instance_number(oElementGreen); i++) {
//			  elementID = instance_find(oElementGreen,i);
//				//destroy element
//				instance_destroy(elementID);
//				//destroy pointer after selection
//				instance_destroy(self)			
//			}		
//			global.pOnePointer = false;
//			global.pOneCastingTurn = false;
//			global.pTwoCastingTurn = true;
//		}	
//	}

//	}
//}
//#endregion










