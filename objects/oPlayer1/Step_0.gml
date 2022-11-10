/// @description Occurs every frame


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


// SELECTION PHASE
#region
	if (global.currentRound == 0) {
		if (global.selectionPhase && !global.pTwoMovementActive) {
			// UPDATE PHASE INFO		
			global.pOneSelectionPhase = true;
			global.pOneMovementActive = true;
			// SET STARTINGT TILE ANIMATION
			setCardAnimation(global.pOneCurrentTile)
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
							ds_list_add(global.pOneList, "red")
						}
						if (_inst.object_index = oGreen) {
							var _newElement = oElementGreen
							ds_list_add(global.pOneList, "green")
						}
						if (_inst.object_index = oYellow) {
							var _newElement = oElementYellow
							ds_list_add(global.pOneList, "yellow")
						}
				
						//store new element				
						instance_create_layer(pOneElements.x,pOneElements.y,"Elements", _newElement)
				
						// UPDATE PHASE INFO					
						global.pOneSelectionPhase = false;
						global.pOneMovementActive = false;						
						global.pTwoSelectionPhase = true;
						global.pTwoMovementActive = true;
					}
				}
			}
		}
	}
	#endregion


//PLAYER ONE TURN
#region
if (global.currentRound >= 1) {
	if (global.gameRound && global.pOneTurn) {
		// UPDATE CURRENT TILE ANIMATION
		setCardAnimation(global.pOneCurrentTile)
		global.pOneMovementActive = true;		
		
		// COLLECT ELEMENT
		#region
			// max element storage is 5
			if (ds_list_size(global.pOneList) < 5) {
				// save current list size
				var _elementsStoredLength = ds_list_size(global.pOneList);
				// collect element that player is on top of
				if (keyboard_check_released(vk_lshift) && place_meeting(x, y, oGameBoard)) {											
					// get id of current tile instance
					var _inst = instance_place(x, y, oGameBoard)										
					// if current tile is animating, collect element
					if (_inst.image_speed == 1) {
						//check for current tile and set associated element
						if (_inst.object_index == oRed) {					
							var _newElement = oElementRed
							ds_list_add(global.pOneList, "red")						
						}
						if (_inst.object_index == oGreen) {						
							var _newElement = oElementGreen
							ds_list_add(global.pOneList, "green")								
						}
						if (_inst.object_index == oYellow) {						
							var _newElement = oElementYellow
							ds_list_add(global.pOneList, "yellow")								
						}
						//check is playerOne is on oPoint
						if(_inst.object_index == oPoint) {				
							room_goto(rm_p1Win);
						}
						
						//store new element
						if (_inst.object_index != oPoint) {
						instance_create_layer(pOneElements.x + elementPositionX ,pOneElements.y,"Elements", _newElement)
						elementPositionX += 20;
						global.pOneCastingActive = true;
						}
						
						// update current tile and set animation after element collection
						global.pOneCurrentTile = _inst;
					}
				}			
				if (_elementsStoredLength < ds_list_size(global.pOneList)) {
					// End Player One Turn
					global.pOneTurn = false;
					global.pOneMovementActive = false;
					global.pTwoTurn = true;				
				}
			}
		}
	}
	#endregion
	
	// if movement isn't active - turn off player animation
	if (!global.pOneMovementActive) {
	oPlayer1.image_index = 0;
	}
	
#endregion
		
		
		
		
		














	
