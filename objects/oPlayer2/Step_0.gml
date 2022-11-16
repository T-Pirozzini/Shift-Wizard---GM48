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

if (global.pTwoTurn) {
	
// SELECTION PHASE
	if (global.selectionPhase && global.pTwoSelectionPhase) {		
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
						//ds_list_add(global.pTwoList, "red")
						ds_list_add(global.pTwoElementList, oElementRed)
					}
					if (_inst.object_index = oGreen) {
						var _newElement = oElementGreen
						//ds_list_add(global.pTwoList, "green")
						ds_list_add(global.pTwoElementList, oElementGreen)
					}
					if (_inst.object_index = oYellow) {
						var _newElement = oElementYellow
						//ds_list_add(global.pTwoList, "yellow")
						ds_list_add(global.pTwoElementList, oElementYellow)
					}
				
					//store new element				
					p2ElementListID = instance_create_layer(pTwoElements.x,pTwoElements.y,"Elements", _newElement)
									
					//end selection phase and start game round
					global.pTwoTurn = false;
					global.pTwoSelectionPhase = false;
					global.selectionPhase = false;
					
					global.collectionPhase = true;
					global.pOneTurn = true;
					global.pOneCollectionPhase = true;					
					global.currentRound++;										
					}
				}									
			}
	}
	

// COLLECTION PHASE
	if (global.currentRound >= 1) {	
		global.gameRound = true;
		if (global.collectionPhase && global.pTwoCollectionPhase) {
			// UPDATE CURRENT TILE ANIMATION
			setCardAnimation(global.pTwoCurrentTile)
			// max element storage is 5
			if (ds_list_size(global.pTwoElementList) < 5) {
				// save current list size
				var _elementsStoredLength = ds_list_size(global.pTwoElementList);
				if (place_meeting(x, y, oGameBoard) && keyboard_check_released(vk_numpad0)) {								
						//get id of current tile instance
						var _inst = instance_place(x, y, oGameBoard)
						// update current tile
						global.pTwoCurrentTile = _inst;
												
						// check if tile is adjacent - add to list and create element instance
						if (_inst.image_speed == 1) {							
							//check for current tile and set associated element
							if (_inst.object_index == oRed) {					
								var _newElement = oElementRed
								//ds_list_add(global.pTwoList, "red")
								ds_list_add(global.pTwoElementList, oElementRed)
							}
							if (_inst.object_index == oGreen) {						
								var _newElement = oElementGreen
								//ds_list_add(global.pTwoList, "green")						
								ds_list_add(global.pTwoElementList, oElementGreen)
							}
							if (_inst.object_index == oYellow) {						
								var _newElement = oElementYellow
								//ds_list_add(global.pTwoList, "yellow")					
								ds_list_add(global.pTwoElementList, oElementYellow)
							}
							//check is playerOne is on oPoint
							if(_inst.object_index == oPoint) {				
								room_goto(rm_p2Win);
							}						
							//store new element
							if (_inst.object_index != oPoint) {
								instance_destroy(p2ElementListID)
								p2ElementListID = instance_create_layer(1063, 150, "Elements", pTwoElements)
								for (var i = 0; i < ds_list_size(global.pTwoElementList); i++) {
									instance_create_layer(p2ElementListID.x + (20*i), p2ElementListID.y, "Elements", ds_list_find_value(global.pTwoElementList, i))			
								}
							}
							//instance_create_layer(pTwoElements.x + elementPositionX, pTwoElements.y,"Elements", _newElement)
								//elementPositionX += 20;	
						}					
					}	
				}
			if (_elementsStoredLength < ds_list_size(global.pTwoElementList)) {
				global.pTwoTurn = false;
				global.pTwoCollectionPhase = false;	
				global.collectionPhase = false;
				global.pOneTurn = true;
				global.castingPhase = true;
				global.pOneCastingPhase = true;
			}
		}
	}
}


// if not player 2 turn, stop animating
if (!global.pTwoMovementActive) {
	oPlayer2.image_index = 0
}
// if player 2 on point and animating is true - win
if (place_meeting(oPlayer2.x, oPlayer2.y, oPoint)) {
	if (oPoint.image_speed = 1) {
		room_goto(rm_p2Win);
	}
}
	