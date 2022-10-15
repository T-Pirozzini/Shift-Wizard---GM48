/// @description Insert description here

//Move arrow left and Right & wall collisions
#region
if (global.pOneCastingActive) {	
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
if (global.pOneCastingActive && global.pOnePointer) {
	if (place_meeting(x, y, oElementRed) && keyboard_check_pressed(ord("1"))) {
		var _index = ds_list_find_index(global.pOneList, "red")
		//remove element from the list
		ds_list_delete(global.pOneList, _index)
		for (i = 0; i < instance_number(oElementRed); i++) {
		  elementID = instance_find(oElementRed,i);
			//destroy element
			instance_destroy(elementID);
			//destroy pointer after selection
			instance_destroy(self)
		}
		global.pOneCastingActive = false;
		global.pOnePointer = false;
	}
	if (place_meeting(x, y, oElementYellow) && keyboard_check_pressed(ord("1"))) {
		var _index = ds_list_find_index(global.pOneList, "yellow")
		//remove element from the list
		ds_list_delete(global.pOneList, _index)
		for (i = 0; i < instance_number(oElementYellow); i++) {
		  elementID = instance_find(oElementYellow,i);
			//destroy element
			instance_destroy(elementID);
			//destroy pointer after selection
			instance_destroy(self)
		}
		global.pOneCastingActive = false;
		global.pOnePointer = false;		
	}
	if (place_meeting(x, y, oElementGreen) && keyboard_check_pressed(ord("1"))) {
		var _index = ds_list_find_index(global.pOneList, "green")
		//remove element from the list
		ds_list_delete(global.pOneList, _index)
		for (i = 0; i < instance_number(oElementGreen); i++) {
		  elementID = instance_find(oElementGreen,i);
			//destroy element
			instance_destroy(elementID);
			//destroy pointer after selection
			instance_destroy(self)			
		}
		global.pOneCastingActive = false;
		global.pOnePointer = false;
	}	
}
#endregion










