/// @description Insert description here

// Player One
if (global.pOneYellowSpell) {
	global.pOnePointerActive = false;
#region
	if (keyboard_check(ord("D"))) {		
			x += 5	
	}
	if (keyboard_check(ord("A"))) {		
		x -= 5			
	}
	if (keyboard_check(ord("S"))) {		
		y += 5		
	}
	if (keyboard_check(ord("W"))) {
		y -= 5				
	}
#endregion	
	
	for (var i = 0; i < instance_number(oGameBoard); i++) {		
			card[i] = instance_find(oGameBoard, i);
			card[i].image_alpha = .4
			card[i].image_speed = 0			
			
			//get up-right adjacent			
			if (place_meeting(global.pOneCurrentTile.x + 100,global.pOneCurrentTile.y - 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}
			//get up-left adjacent			
			if (place_meeting(global.pOneCurrentTile.x - 100,global.pOneCurrentTile.y - 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}
			//get down-right adjacent			
			if (place_meeting(global.pOneCurrentTile.x + 100,global.pOneCurrentTile.y + 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}
			//get down-left adjacent			
			if (place_meeting(global.pOneCurrentTile.x - 100,global.pOneCurrentTile.y + 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}		
		} 
	}
	instance_create_layer(190, 144, "Instances", oBack)	
	if (place_meeting(x,y, oBack)) {		
		instance_destroy(oYellowWand)
		instance_destroy(oYellowInstructions)
		global.pOneYellowSpell = false
		global.pOnePointerActive = true;
		ds_list_add(global.pOneElementList, oYellow)
		instance_destroy(oBack)
	}
	
	if (place_meeting(x, y, oGameBoard)){
		if (keyboard_check(vk_lshift)) {
		var _inst = instance_position(x, y, oGameBoard)
			if (_inst.image_speed = 1) {
				if (_inst.object_index == oPoint) {
				room_goto(rm_p1Win)				
				}
			oPlayer1.x = _inst.x;
			oPlayer1.y = _inst.y;
			
			instance_destroy(oYellowWand)
			instance_destroy(oYellowInstructions)
				
			// update current tile and set animation after element collection					
			global.pOneCurrentTile = _inst			
			
			global.pOneTurn = false;
			global.pOneYellowSpell = false;		 
			global.pOneCastingPhase = false;				 	 
			global.pTwoCastingPhase = true;
			global.pTwoTurn = true;
			}
		}
	}
	
	
	// Player Two
if (global.pTwoYellowSpell) {
	global.pTwoPointerActive = false;
#region
	if (keyboard_check(vk_right)) {		
		x += 5	
	}
	if (keyboard_check(vk_left)) {		
		x -= 5			
	}
	if (keyboard_check(vk_down)) {		
		y += 5		
	}
	if (keyboard_check(vk_up)) {		
		y -= 5				
	}
#endregion
	
	
	for (var i = 0; i < instance_number(oGameBoard); i++) {		
			card[i] = instance_find(oGameBoard, i);
			card[i].image_alpha = .4
			card[i].image_speed = 0			
			
			//get up-right adjacent			
			if (place_meeting(global.pTwoCurrentTile.x + 100,global.pTwoCurrentTile.y - 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}
			//get up-left adjacent			
			if (place_meeting(global.pTwoCurrentTile.x - 100,global.pTwoCurrentTile.y - 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}
			//get down-right adjacent			
			if (place_meeting(global.pTwoCurrentTile.x + 100,global.pTwoCurrentTile.y + 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}
			//get down-left adjacent			
			if (place_meeting(global.pTwoCurrentTile.x - 100,global.pTwoCurrentTile.y + 100, card[i])) {
				card[i].image_speed = 1
				card[i].image_alpha = 1				
			}		
		} 
	}
	
	instance_create_layer(1024, 144, "Instances", oBack)	
	if (place_meeting(x,y, oBack)) {		
		instance_destroy(oYellowWand)
		instance_destroy(oYellowInstructions)
		global.pTwoYellowSpell = false
		global.pTwoPointerActive = true;
		ds_list_add(global.pTwoElementList, oYellow)
		instance_destroy(oBack)
	}
	
	if (place_meeting(x, y, oGameBoard)){
		if (keyboard_check(vk_numpad0)) {
		var _inst = instance_position(x, y, oGameBoard)
			if (_inst.image_speed = 1) {
				if (_inst.object_index == oPoint) {
				room_goto(rm_p2Win)
				global.currentRound = 0
				}
			oPlayer2.x = _inst.x;
			oPlayer2.y = _inst.y;
			
			instance_destroy(oYellowWand)
			instance_destroy(oYellowInstructions)
				
			// update current tile and set animation after element collection					
			global.pTwoCurrentTile = _inst			
			
			global.pTwoTurn = false
			global.pTwoYellowSpell = false;			
			global.pTwoCastingPhase = false;									
			global.pOneTurn = true;
			global.collectionPhase = true;
			global.pOneCollectionPhase = true;
			global.castingPhase = false;
			}
		}
	}
	
