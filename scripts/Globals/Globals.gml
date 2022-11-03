

// game rounds
global.gameSetup = true; //set up game board
global.selectionPhase = true; //players select starting tiles


// game begin state
	// starting tile
	global.p1SelectStartingTile = true;
	global.p2SelectStartingTile = false;




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
		global.pOneGreenSpell = false;
		
		global.pOneCurrentTile = 0
		
	// Player Two
		global.pTwoMovementActive = false;
		global.pTwoCastingActive = false;
		global.pTwoPointerActive = false;
		
		global.pTwoYellowSpell = false;
		global.pTwoRedSpell = false;	
		global.pTwoGreenSpell = false;		

	global.currentRound = 1;
	
	global.newRound = false;
	global.newRound1 = false;

global.setID = false

// Stored Element Lists
	global.pOneList = ds_list_create();
	global.pTwoList = ds_list_create();

