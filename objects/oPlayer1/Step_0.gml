// PLAYER MOVEMENT
#region
	// GET INPUT
	rightKey = keyboard_check(ord("D"));
	leftKey = keyboard_check(ord("A"));
	upKey = keyboard_check(ord("W"));
	downKey = keyboard_check(ord("S"));
	
	// MOVEMENT
#region
	if (global.pOneMovementActive) {	
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

if (global.pOneTurn) {
	
	// SELECTION PHASE		
	if (global.selectionPhase && global.pOneSelectionPhase) {			
		// SET STARTING TILE ANIMATION
		setCardAnimation(global.pOneCurrentTile) // sets tile to 0
		// SET STARTING TILE
		if (place_meeting(x, y, oGameBoard)) {
			if (keyboard_check_released(vk_lshift)) {
				//get id of current tile instance
				var _inst = instance_place(x, y, oGameBoard)
				// update current tile
				global.pOneCurrentTile = _inst;
				
					//check if current tile is on the perimeter of the gameboard
					if (place_meeting(_inst.x, _inst.y, oPerimeter)) {			
				
						//check for current tile and set associated element
						if (_inst.object_index = oRed) {
							var _newElement = oElementRed
							//ds_list_add(global.pOneList, "red")
							ds_list_add(global.pOneElementList, oElementRed)
						}
						if (_inst.object_index = oGreen) {
							var _newElement = oElementGreen
							//ds_list_add(global.pOneList, "green")
							ds_list_add(global.pOneElementList, oElementGreen)
						}
						if (_inst.object_index = oYellow) {
							var _newElement = oElementYellow
							//ds_list_add(global.pOneList, "yellow")
							ds_list_add(global.pOneElementList, oElementYellow)
						}
				
						//store new element
						//for (var i = 0; i < ds_list_size(global.pOneElementList); i++) {
						//			instance_create_layer(pOneElements.x, pOneElements.y, "Elements", ds_list_find_value(global.pOneElementList, i))
						//		}
						p1ElementListID = instance_create_layer(pOneElements.x,pOneElements.y,"Elements", _newElement)
				
						// UPDATE PHASE INFO		
						global.pOneTurn = false;
						global.pOneSelectionPhase = false;
						global.pTwoTurn = true;						
						global.pTwoSelectionPhase = true;
					};
				};
			};
		};
	
	// COLLECTION PHASE
	if (global.currentRound >= 1) {	
		global.gameRound = true;
		if (global.collectionPhase && global.pOneCollectionPhase) {
			// UPDATE CURRENT TILE ANIMATION
			setCardAnimation(global.pOneCurrentTile)
			// max element storage is 5
			if (ds_list_size(global.pOneElementList) < 5) {
				// save current list size
				var _elementsStoredLength = ds_list_size(global.pOneElementList);
				if (place_meeting(x, y, oGameBoard) && keyboard_check_released(vk_lshift)) {								
						//get id of current tile instance
						var _inst = instance_place(x, y, oGameBoard)						
												
						// check if tile is adjacent - add to list and create element instance
						if (_inst.image_speed == 1) {							
							//check for current tile and set associated element
							if (_inst.object_index == oRed) {					
								var _newElement = oElementRed
								//ds_list_add(global.pOneList, "red")
								ds_list_add(global.pOneElementList, oElementRed)
							}
							if (_inst.object_index == oGreen) {						
								var _newElement = oElementGreen
								//ds_list_add(global.pOneList, "green")
								ds_list_add(global.pOneElementList, oElementGreen)
							}
							if (_inst.object_index == oYellow) {						
								var _newElement = oElementYellow
								//ds_list_add(global.pOneList, "yellow")
								ds_list_add(global.pOneElementList, oElementYellow)
							}
							//check if playerOne is on oPoint
							if(_inst.object_index == oPoint) {				
								room_goto(rm_p1Win);
							}						
							//store new element
							if (_inst.object_index != oPoint) {	
								instance_destroy(p1ElementListID)
								p1ElementListID = instance_create_layer(48, 144, "Elements", pOneElements)
								for (var i = 0; i < ds_list_size(global.pOneElementList); i++) {
									instance_create_layer(p1ElementListID.x + (20*i), p1ElementListID.y, "Elements", ds_list_find_value(global.pOneElementList, i))
								}
								//instance_create_layer(pOneElements.x + elementPositionX, pOneElements.y,"Elements", _newElement)
								//elementPositionX += 20;						
							}
							// update current tile
							global.pOneCurrentTile = _inst;
						}					
					}	
				}
			if (_elementsStoredLength < ds_list_size(global.pOneElementList)) {
			global.pOneTurn = false;
			global.pOneCollectionPhase = false;	
			global.pTwoTurn = true;
			global.pTwoCollectionPhase = true;
			}
		}
	}
}

// if movement isn't active - turn off player animation
if (!global.pOneMovementActive) {
oPlayer1.image_index = 0;
}

// if player 1 on point and animating is true - win
if (place_meeting(oPlayer1.x, oPlayer1.y, oPoint)) {
	if (oPoint.image_speed = 1) {
		room_goto(rm_p1Win);
		global.currentRound = 0		
	}
}


