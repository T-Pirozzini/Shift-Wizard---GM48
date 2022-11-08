// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkAdjacent(x,y,obj){	
	//get right adjacent			
			if (place_meeting(x + 100, y, obj)) {
				return true
			}
			//get left adjacent			
			if (place_meeting(x - 100,y, obj)) {
				return true
			}
			//get up adjacent			
			if (place_meeting(x,y - 100, obj)) {
				return true
			}
			//get down adjacent			
			if (place_meeting(x,y + 100, obj)) {
				return true
			}		
}