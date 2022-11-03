/// @description Insert description here

if (global.selectionPhase) {
	if (place_meeting(oPlayer1.x, oPlayer1.y, oGameBoard)) {
		if (keyboard_check_pressed(vk_enter)) {
			ds_list_add(global.pOneList, oElementGreen)
			instance_create_layer(x,y,"Spells", oElementGreen)
		}
	}	
}
