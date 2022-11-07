global.test = false

// game setup
global.gameSetup = true; //set up game board

// current round
global.currentRound = 0

// selection phase
global.selectionPhase = false; //players select starting tiles
global.pOneSelectionPhase = false; //p1 selection
global.pTwoSelectionPhase = false; //p2 selection


global.gameRound = false;
// player one turn
global.pOneTurn = false;
global.pTwoTurn = false;

// game begin state
	// starting tile
	//global.p1SelectStartingTile = true;
	//global.p2SelectStartingTile = false;




global.gameStart = true
global.gameStart2 = true
// Game Phases
	global.movementPhase = false;
	global.castingPhase = false;
	
//Player Phase States	
	//Player One
		global.pOneMovementActive = false;
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


	
	global.newRound = false;
	global.newRound1 = false;

global.setID = false

// Stored Element Lists
	global.pOneList = ds_list_create();
	global.pTwoList = ds_list_create();

