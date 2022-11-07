// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setCardAnimation(_id, _name){
	
	// Selection Phase: Animate tiles on perimeter
	if (global.selectionPhase) {
		if (place_meeting(x, y, oPerimeter)) {
			animate = true;
		}
	}
	
	// Game Round: Animate tile each player is on
	if (global.gameRound) {
		var _tile = layer_instance_get_instance(_id)
		_tile.animate = false;
		//animate = false;
	 //if (place_meeting(x, y, oPlayerParent)) {
		//	currentTileID.animate = true;
		//}	 
	}
	
	

	if (!animate) {
	 image_speed = 0;
	}
}