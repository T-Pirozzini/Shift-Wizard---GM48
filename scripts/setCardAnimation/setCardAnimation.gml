// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setCardAnimation(currentTile){
	
	// SELECTION PHASE: Animate tiles on perimeter
	if (global.selectionPhase) {		
		for (var i = 0; i < instance_number(oGameBoard); i++) {		
			card[i] = instance_find(oGameBoard, i);
			if (place_meeting(card[i].x, card[i].y, oPerimeter)) {			
				card[i].image_speed = 1
			}
			if (!place_meeting(card[i].x, card[i].y, oPerimeter)) {
				card[i].image_speed = 0;
				card[i].image_alpha = .4;
			}
		}		
	}
	
	// GAME ROUND: Animate tile each player is on
	if (global.gameRound) {						
		for (var i = 0; i < instance_number(oGameBoard); i++) {		
			card[i] = instance_find(oGameBoard, i);
			card[i].image_alpha = .4
			card[i].image_speed = 0			
			
			//get right adjacent			
			if (place_meeting(currentTile.x + 100,currentTile.y, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = .8				
			}
			//get left adjacent			
			if (place_meeting(currentTile.x - 100,currentTile.y, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = .8				
			}
			//get up adjacent			
			if (place_meeting(currentTile.x,currentTile.y - 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = .8				
			}
			//get down adjacent			
			if (place_meeting(currentTile.x,currentTile.y + 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = .8				
			}		
		} 
	}
	
	
}