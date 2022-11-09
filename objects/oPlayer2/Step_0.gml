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
	if (global.selectionPhase && !global.pOneMovementActive) {		
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
						global.pTwoSelectionPhase = false;
						global.pTwoMovementActive = false;						
						//end selection phase and start game round
						global.gameRound = true
						global.currentRound++
						global.pOneTurn = true
					}
				}									
			}
		}
	}
#endregion


//PLAYER TWO TURN
#region
if (global.currentRound >= 1) {
	if (global.gameRound && global.pTwoTurn) {
		// UPDATE CURRENT TILE ANIMATION
		setCardAnimation(global.pTwoCurrentTile)
		global.pTwoMovementActive = true;
		
		// COLLECT ELEMENT
		#region
			// max element storage is 5
			if (ds_list_size(global.pTwoList) < 5) {
				// save current list size
				var _elementsStoredLength = ds_list_size(global.pTwoList);
				// collect element that player is on top of
				if (keyboard_check_released(vk_numpad0) && place_meeting(x, y, oGameBoard)) {											
					// get id of current tile instance
					var _inst = instance_place(x, y, oGameBoard)										
					// if current tile is animating, collect element
					if (_inst.image_speed == 1) {
						//check for current tile and set associated element
						if (_inst.object_index == oRed) {					
							var _newElement = oElementRed
							ds_list_add(global.pTwoList, "red")						
						}
						if (_inst.object_index == oGreen) {						
							var _newElement = oElementGreen
							ds_list_add(global.pTwoList, "green")								
						}
						if (_inst.object_index == oYellow) {						
							var _newElement = oElementYellow
							ds_list_add(global.pTwoList, "yellow")								
						}
						
						//store new element						
						instance_create_layer(pTwoElements.x + spellBagX ,pTwoElements.y,"Elements", _newElement)
						spellBagX += 20;
						
						// update current tile and set animation after element collection
						global.pTwoCurrentTile = _inst;
					}
				}			
				if (_elementsStoredLength < ds_list_size(global.pTwoList)) {
					// End Player Two Turn
					global.pTwoTurn = false;
					global.pTwoMovementActive = false;
					global.pOneTurn = true;				
				}
			}			
		}
	}
	#endregion
	
	if (!global.pTwoMovementActive) {
	oPlayer2.image_index = 0
	}

#endregion



//		//check is playerOne is on oPoint
//		if(instance_position(x,y,oPoint) == adjacentRightPoint2 || instance_position(x,y,oPoint) == adjacentLeftPoint2 || instance_position(x,y,oPoint) == adjacentDownPoint2 || instance_position(x,y,oPoint) == adjacentUpPoint2) {
//			if ((place_meeting(x, y, oPoint)) && keyboard_check_released(vk_numpad0)) {
//				//room_goto(rm_start)
//				room_goto(rm_p2Win);
//			}
//		}





	