// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collectElement(playerList, playerElements, playerTile, playerTurn, playerWin, playerButton){
	// max element storage is 5
	if (ds_list_size(playerList) < 5) {
		// save current list size
		var _elementsStoredLength = ds_list_size(playerList);
		// collect element that player is on top of
		if (keyboard_check_released(playerButton) && place_meeting(x, y, oGameBoard)) {											
			// get id of current tile instance
			var _inst = instance_place(x, y, oGameBoard)										
			// if current tile is animating, collect element
			if (_inst.image_speed == 1) {
				//check for current tile and set associated element
				if (_inst.object_index == oRed) {					
					var _newElement = oElementRed
					ds_list_add(playerList, "red")						
				}
				if (_inst.object_index == oGreen) {						
					var _newElement = oElementGreen
					ds_list_add(playerList, "green")								
				}
				if (_inst.object_index == oYellow) {						
					var _newElement = oElementYellow
					ds_list_add(playerList, "yellow")								
				}
				//check is playerOne is on oPoint
				if(_inst.object_index == oPoint) {				
					room_goto(playerWin);
				}
						
				//store new element
				if (_inst.object_index != oPoint) {
				instance_create_layer(playerElements.x + elementPositionX ,playerElements.y,"Elements", _newElement)
				elementPositionX += 20;						
				}
						
				// update current tile and set animation after element collection
				playerTile = _inst;
			}
		}		
		if (_elementsStoredLength < ds_list_size(playerList)) {
			// End Player One Turn
			if (global.pOneCollectionPhase) {
				global.pOneTurn = false;				
				global.pTwoTurn = true;
				global.pTwoCollectionPhase = true;
			}
			if (global.pTwoCollectionPhase) {
				global.pTwoTurn = false;
				global.pOneTurn = true;	
				global.collectionPhase = false;
				global.castingPhase = true;											
			}			
		}
	}
}