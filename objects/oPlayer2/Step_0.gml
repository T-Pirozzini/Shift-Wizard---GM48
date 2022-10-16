/// @description Occurs every frame

//Get input
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
upKey = keyboard_check(vk_up);
downKey = keyboard_check(vk_down);

//Player movement
#region
if (global.pTwoMovementActive) {
	xspd = moveSpd * (rightKey - leftKey); // if right = 1, if left = -1, if both pressed = 0 (no movement)
	yspd = (downKey - upKey); // top left is coord (0,0) - moving down increases y-axis

	if (yspd == 0) {	// x facing and accounting for diagonal movement
		if (xspd > 0) {
		 face = 0
		};
		if (xspd < 0) {
		 face = 2
		};
	};
	if (xspd > 0 && face == 2) {
		face = 0
	};
	if (xspd < 0 && face == 0) {
		face = 2
	};

	if (xspd == 0) { // y facing and accounting for diagonal movement
		if (yspd > 0) {
		 face = 3
		};
		if (yspd < 0) {
		 face = 1
		};
	};
	if (yspd > 0 && face == 1) {
		face = 3
	};
	if (yspd < 0 && face == 3) {
		face = 1
	};

	sprite_index = sprite[face];

		// move the player
		x += xspd;
		y += yspd;	
	
		//animate
		if (xspd == 0 && yspd == 0) {		
			image_index = 0;		
		};
	
		// depth
	depth = -bbox_bottom;
}
#endregion
	
//Collect Elements
#region
if (global.movementPhase) {
if (global.pTwoMovementActive) {	
	if (ds_list_size(global.pTwoList) < 5) {
		var _currentArrLength = ds_list_size(global.pTwoList);
		if(instance_position(x,y,oRed) == adjacentRight2 || instance_position(x,y,oRed) == adjacentLeft2 || instance_position(x,y,oRed) == adjacentDown2 || instance_position(x,y,oRed) == adjacentUp2) {
		if ((place_meeting(x, y, oRed)) && keyboard_check_released(vk_numpad0)) {			
			ds_list_add(global.pTwoList, "red")
			instance_create_layer(pTwoElements.x + elementPositionY, pTwoElements.y, "Instances", oElementRed)
			//elementPositionY += 20			
		};
		}
		if(instance_position(x,y,oGreen) == adjacentRight2 || instance_position(x,y,oGreen) == adjacentLeft2 || instance_position(x,y,oGreen) == adjacentDown2 || instance_position(x,y,oGreen) == adjacentUp2) {
		if ((place_meeting(x, y, oGreen)) && keyboard_check_released(vk_numpad0)) {
			ds_list_add(global.pTwoList, "green")
			instance_create_layer(pTwoElements.x + elementPositionY, pTwoElements.y, "Instances", oElementGreen)
			//elementPositionY += 20			
		};
		}
		if(instance_position(x,y,oYellow) == adjacentRight2 || instance_position(x,y,oYellow) == adjacentLeft2 || instance_position(x,y,oYellow) == adjacentDown2 || instance_position(x,y,oYellow) == adjacentUp2) {
		if ((place_meeting(x, y, oYellow)) && keyboard_check_released(vk_numpad0)) {			
			ds_list_add(global.pTwoList, "yellow")
			instance_create_layer(pTwoElements.x + elementPositionY, pTwoElements.y, "Instances", oElementYellow)
			//elementPositionY += 20			
		};
		}
		//check is playerOne is on oPoint
		if(instance_position(x,y,oPoint) == adjacentRightPoint2 || instance_position(x,y,oPoint) == adjacentLeftPoint2 || instance_position(x,y,oPoint) == adjacentDownPoint2 || instance_position(x,y,oPoint) == adjacentUpPoint2) {
			if ((place_meeting(x, y, oPoint)) && keyboard_check_released(vk_numpad0)) {
				//room_goto(rm_start)
				room_goto_next();
			}
		}
		if (_currentArrLength < ds_list_size(global.pTwoList)) {
			// End Player One Movement Phase
			global.pTwoMovementActive = false;
			global.pOneCastingActive = true;
			global.pOnePointerActive = true;
			getTileID2();
		}
	}
	}
}	
#endregion	

if (!global.pTwoMovementActive) {
	oPlayer2.image_index = 0
}

// At beginning of round check current tile reference
#region
function getTileID2 () {
		if (place_meeting(x,y,oRed)) {
			currentTile2 = instance_position(x,y,oRed)
			//currentTile2.animate = true;
			//currentTile2.active = true;			
		}
		if (place_meeting(x,y,oGreen)) {
			currentTile2 = instance_position(x,y,oGreen)
			//currentTile2.animate = true;
			//currentTile2.active = true;			
		}
		if (place_meeting(x,y,oYellow)) {
			currentTile2 = instance_position(x,y,oYellow)
			//currentTile2.animate = true;
			//currentTile2.active = true;			
		}
	}
	
if (global.gameStart2) {	
	getTileID2();	
	global.gameStart2 = false;
}
if (global.newRound) {	
	getTileID2();
	global.newRound = false
}

// get reference of tiles adjacent to currentTile 
adjacentRight2 = instance_position(currentTile2.x + 80, currentTile2.y, oCard)
adjacentLeft2 = instance_position(currentTile2.x - 50, currentTile2.y + 10, oCard)
adjacentDown2 = instance_position(currentTile2.x + 10, currentTile2.y - 50, oCard)
adjacentUp2 = instance_position(currentTile2.x, currentTile2.y + 80, oCard)

adjacentRightPoint2 = instance_position(currentTile2.x + 80, currentTile2.y, oPoint)
adjacentLeftPoint2 = instance_position(currentTile2.x - 50, currentTile2.y, oPoint)
adjacentDownPoint2 = instance_position(currentTile2.x, currentTile2.y - 50, oPoint)
adjacentUpPoint2 = instance_position(currentTile2.x, currentTile2.y + 80, oPoint)
#endregion

	