// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setCardAnimation(){
	
	// Selection Phase: Animate tiles on perimeter
	if (global.selectionPhase) {
		if (!place_meeting(x, y, oPerimeter)) {
			animate = false
		}
	}

	if (!animate) {
	 image_speed = 0;
	}
}