/// @description Occurs every frame

// PLAYER MOVEMENT
#region
	// GET INPUT
	rightKey = keyboard_check(vk_right);
	leftKey = keyboard_check(vk_left);
	upKey = keyboard_check(vk_up);
	downKey = keyboard_check(vk_down);
	
	// MOVEMENT
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
	
	if (place_meeting(x + xspd, y, oWall)) {
			xspd = 0;
		};
		if (place_meeting(x, y + yspd, oWall)) {
			yspd = 0;
		};
		
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
#endregion


// SELECTION PHASE
#region
if (global.currentRound == 0) {
	if (global.selectionPhase && global.pTwoTurn) {
		// UPDATE PHASE INFO
		global.pTwoMovementActive = true;
		// SET STARTING TILE ANIMATION
		setCardAnimation(global.pTwoCurrentTile)
		// SET STARTING TILE
		if (place_meeting(x, y, oGameBoard)) {
			if (keyboard_check_pressed(vk_numpad0)) {				
				// get ID of current tile instance
				var _inst = instance_place(x, y, oGameBoard)				
				// update current tile
				global.pTwoCurrentTile = _inst
				
				//check if current tile is on the perimeter of the gameboard
				if (place_meeting(_inst.x, _inst.y, oPerimeter)) {
					
					//check for current tile and set associated element
						if (_inst.object_index = oRed) {
							var _newElement = oElementRed
							ds_list_add(global.pTwoList, "red")
						}
						if (_inst.object_index = oGreen) {
							var _newElement = oElementGreen
							ds_list_add(global.pTwoList, "green")
						}
						if (_inst.object_index = oYellow) {
							var _newElement = oElementYellow
							ds_list_add(global.pTwoList, "yellow")
						}
				
						//store new element				
						instance_create_layer(pTwoElements.x,pTwoElements.y,"Elements", _newElement)
				
						//update phase information
						global.pTwoTurn = false;						
						global.pTwoMovementActive = false;						
						
						//end selection phase and start game round
						global.selectionPhase = false
						global.pOneTurn = true;
						global.currentRound++						
					}
				}									
			}
		}
	}
#endregion

// GAME ROUND
if (global.currentRound >= 1) {
	global.gameRound = true;
}

//PLAYER TWO TURN
#region
	if (global.gameRound && !global.pOneTurn) {
		// START MOVEMENT PHASE
		global.pTwoMovementActive = true;		
		// UPDATE CURRENT TILE ANIMATION
		setCardAnimation(global.pTwoCurrentTile)	
		// COLLECT ELEMENT
		collectElement(global.pTwoList, pTwoElements, global.pTwoCurrentTile, global.pTwoTurn, rm_p2Win, vk_numpad0);
		// UPDATE CURRENT TURN
		global.pOneTurn = true;
		
		global.pTwoTurn = false;
		global.pTwoMovementActive = false;
		
		global.castingPhase = true;
	}


// if not player 2 turn, stop animating
if (!global.pTwoMovementActive) {
	oPlayer2.image_index = 0
}

#endregion
	