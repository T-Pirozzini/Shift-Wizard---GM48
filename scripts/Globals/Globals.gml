// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Game Phases
	global.movementPhase = true;
	global.castingPhase = false;
	
//Player Phase States	
	//Player One
		global.pOneMovementActive = true;
		global.pOneCastingActive = false;
		global.pOnePointerActive = false;
	// Player Two
		global.pTwoMovementActive = true;
		global.pTwoCastingActive = false;
		global.pTwoPointerActive = false;

 	






// Stored Element Lists
	global.pOneList = ds_list_create();
	global.pTwoList = ds_list_create();

