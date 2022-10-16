// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.gameStart = true
global.gameStart2 = true
// Game Phases
	global.movementPhase = true;
	global.castingPhase = false;
	
//Player Phase States	
	//Player One
		global.pOneMovementActive = true;
		global.pOneCastingActive = false;
		global.pOnePointerActive = false;
		
		global.pOneYellowSpell = false;
		global.pOneRedSpell = false;
		global.pOneCurrentTile = 0
		
	// Player Two
		global.pTwoMovementActive = false;
		global.pTwoCastingActive = false;
		global.pTwoPointerActive = false;
		
		global.pTwoYellowSpell = false;

	global.currentRound = 1;


// Stored Element Lists
	global.pOneList = ds_list_create();
	global.pTwoList = ds_list_create();

