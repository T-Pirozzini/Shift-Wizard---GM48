/// @description Occurs every frame


// PLAYER MOVEMENT
#region
	// GET INPUT
	rightKey = keyboard_check(ord("D"));
	leftKey = keyboard_check(ord("A"));
	upKey = keyboard_check(ord("W"));
	downKey = keyboard_check(ord("S"));
	
	// PLAYER MOVEMENT
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
	if (global.selectionPhase && !global.pTwoMovementActive) {
		// update phase information
		global.movementPhase = true;
		global.pOneSelectionPhase = true;
		global.pOneMovementActive = true;
		
		if (place_meeting(x, y, oGameBoard)) {
			if (keyboard_check_pressed(vk_lshift)) {
				//get id of current tile instance
				var _inst = instance_place(x, y, oGameBoard)
				
				//check if current tile is on the perimeter of the gameboard
				if (place_meeting(_inst.x, _inst.y, oPerimeter)) {			
				
					//check for current tile and set associated element
					if (_inst.object_index = oRed) {
						var _newElement = oElementRed
					}
					if (_inst.object_index = oGreen) {
						var _newElement = oElementGreen
					}
					if (_inst.object_index = oYellow) {
						var _newElement = oElementYellow
					}
				
					//store new element				
					instance_create_layer(pOneElements.x,pOneElements.y,"Elements", _newElement)
				
					//update phase information
					global.pTwoSelectionPhase = true;
					global.pTwoMovementActive = true;
					global.pOneSelectionPhase = false;
					global.pOneMovementActive = false;					
				}
			}
		}
	};
	#endregion

//PLAYER ONE TURN
	if (global.gameRound && global.pOneTurn) {		
	// COLLECT ELEMENT			
				global.pOneMovementActive = true;
				if (keyboard_check_pressed(vk_lshift) && place_meeting(x, y, oGameBoard)) {
					//get id of current tile instance
					var _inst = instance_place(x, y, oGameBoard)			
						
						//check for current tile and set associated element
						if (_inst.object_index = oRed) {
							var _newElement = oElementRed
						}
						if (_inst.object_index = oGreen) {
							var _newElement = oElementGreen
						}
						if (_inst.object_index = oYellow) {
							var _newElement = oElementYellow
						}
				
						//store new element				
						instance_create_layer(pOneElements.x + 50,pOneElements.y,"Elements", _newElement)
				}
			}
		




// PLAYER ONE TURN
#region
	// COLLECT ELEMENTS
	//if (global.movementPhase) {
	//if (global.pOneMovementActive) {
		
	//// max elements stored is 5
	//if (ds_list_size(global.pOneList) < 5) {
		
	//	if (keyboard_check_pressed(vk_enter)) {
	//	//save current list size
	//	var _elementsStoredLength = ds_list_size(global.pOneList);
		
	//	//get id of current tile instance
	//			var _inst = instance_place(x, y, oGameBoard)
		
	//	//check for current tile and set associated element
	//				if (_inst.object_index = oRed) {
	//					var _newElement = oElementRed
	//				}
		
	//	//store new element				
	//				instance_create_layer(pOneElements.x,pOneElements.y,"Elements", _newElement)
		
	//	//check if playerOne is on redCard		
	//	//if(instance_position(x,y,oRed) == adjacentRight || instance_position(x,y,oRed) == adjacentLeft || instance_position(x,y,oRed) == adjacentDown || instance_position(x,y,oRed) == adjacentUp) {
	//	//if ((place_meeting(x, y, oRed)) && keyboard_check_released(vk_lshift)) {
	//		//oRed.object_index
	//		ds_list_add(global.pOneList, "red")
			
			
	//		if (_elementsStoredLength < ds_list_size(global.pOneList)) {
	//		// End Player One Movement Phase
	//		global.pOneMovementActive = false;
	//		global.pTwoMovementActive = true;
	//		getTileID();
	//	}
	//		//create redElement on Instances layer
	//		//instance_create_layer(pOneElements.x + elementPositionX, pOneElements.y, "Instances", oElementRed)
	//		//elementPositionX += 20;			
	//	//};
	//	}
	//}
	
		//check if playerOne is on greenCard
		if(instance_position(x,y,oGreen) == adjacentRight || instance_position(x,y,oGreen) == adjacentLeft || instance_position(x,y,oGreen) == adjacentDown || instance_position(x,y,oGreen) == adjacentUp) {
		if ((place_meeting(x, y, oGreen)) && keyboard_check_released(vk_lshift)) {
			ds_list_add(global.pOneList, "green")
			instance_create_layer(pOneElements.x + elementPositionX, pOneElements.y, "Instances", oElementGreen)
			//elementPositionX += 20;			
		};
		}
		//check if playerOne is on yellowCard
		if(instance_position(x,y,oYellow) == adjacentRight || instance_position(x,y,oYellow) == adjacentLeft || instance_position(x,y,oYellow) == adjacentDown || instance_position(x,y,oYellow) == adjacentUp) {
		if ((place_meeting(x, y, oYellow)) && keyboard_check_released(vk_lshift)) {			
			ds_list_add(global.pOneList, "yellow")
			instance_create_layer(pOneElements.x + elementPositionX, pOneElements.y, "Instances", oElementYellow)
			//elementPositionX += 20;			
		};
		}
		//check is playerOne is on oPoint
		if(instance_position(x,y,oPoint) == adjacentRightPoint || instance_position(x,y,oPoint) == adjacentLeftPoint || instance_position(x,y,oPoint) == adjacentDownPoint || instance_position(x,y,oPoint) == adjacentUpPoint) {
			if ((place_meeting(x, y, oPoint)) && keyboard_check_released(vk_lshift)) {
				//room_goto(rm_start)
				room_goto(rm_p1Win);
			}
		}
		
		//if (_elementsStoredLength < ds_list_size(global.pOneList)) {
		//	// End Player One Movement Phase
		//	global.pOneMovementActive = false;
		//	global.pTwoMovementActive = true;
		//	getTileID();
		//}
	//}
	//}
//}
	



#endregion


if (!global.pOneMovementActive) {
	oPlayer1.image_index = 0;
}

// Collisions
function getCurrentPosition(player) {	
	currentPositionX = player.x 
	currentPositionY = player.y
}

// At beginning of round check current tile reference
#region

function getTileID () {
		if (place_meeting(x,y,oRed)) {
			currentTile = instance_position(x,y,oRed)
			//currentTile.animate = true;
			//currentTile.active = true;
			//global.pOneCurrentTile = currentTile
		}
		if (place_meeting(x,y,oGreen)) {
			currentTile = instance_position(x,y,oGreen)
			//currentTile.animate = true;
			//currentTile.active = true;
			//global.pOneCurrentTile = currentTile
		}
		if (place_meeting(x,y,oYellow)) {
			currentTile = instance_position(x,y,oYellow)
			//currentTile.animate = true;
			//currentTile.active = true;	
			//global.pOneCurrentTile = currentTile
		}
	}
	
//if (global.gameStart) {
//	getCurrentPosition(oPlayer1);
//	getTileID();
//	prevCurrentRound++
//	global.gameStart = false;
//}
//if (global.newRound1) {
//	getTileID();	
//	global.newRound1 = false
//}

if (global.gameStart) {	
	getTileID();	
	global.gameStart = false;
	//global.newRound2 = true;
}
if (global.pTwoCastingActive) {
	getTileID()
}
if (global.setID) {
	getTileID()
}



// get reference of tiles adjacent to currentTile 
adjacentRight = instance_position(currentTile.x + 80, currentTile.y, oGameBoard)
adjacentLeft = instance_position(currentTile.x - 50, currentTile.y, oGameBoard)
adjacentDown = instance_position(currentTile.x, currentTile.y - 50, oGameBoard)
adjacentUp = instance_position(currentTile.x, currentTile.y + 80, oGameBoard)


adjacentRightPoint = instance_position(currentTile.x + 80, currentTile.y, oPoint)
adjacentLeftPoint = instance_position(currentTile.x - 50, currentTile.y, oPoint)
adjacentDownPoint = instance_position(currentTile.x, currentTile.y - 50, oPoint)
adjacentUpPoint = instance_position(currentTile.x, currentTile.y + 80, oPoint)

#endregion








	
