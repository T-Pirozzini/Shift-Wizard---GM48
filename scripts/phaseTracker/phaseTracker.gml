
// game setup
global.gameSetup = true; //set up game board

// current round
global.currentRound = 0

//currentTurn
global.pOneTurn = false;
global.pTwoTurn = false;

// selection phase
global.selectionPhase = true; //players select starting tiles
global.pOneSelectionPhase = true; //p1 selection
global.pTwoSelectionPhase = false; //p2 selection

// Game Phase
global.collectionPhase = false;
global.gameRound = false;
	// Player One
	global.pOneCollectionPhase = false
	global.pOneCurrentTile = 0;
	global.pOneMovementActive = false;
	// Player Two
	
	global.pTwoCollectionPhase = false
	global.pTwoCurrentTile = 0;
	global.pTwoMovementActive = false;

// Casting Phase

	// Player One
	global.pOneCastingPhase = false;
	global.pOnePointerActive = false;
	// Player Two
	global.pTwoCastingPhase = false;
	global.pTwoPointerActive = false;






// Game Phases
	global.movementPhase = false;
	global.castingPhase = false;
	

		
		
		
		
		global.pOneYellowSpell = false;
		global.pOneRedSpell = false;
		global.pOneGreenSpell = false;
		
		
		
	// Player Two
		
		
		
		
		global.pTwoYellowSpell = false;
		global.pTwoRedSpell = false;	
		global.pTwoGreenSpell = false;		




// Stored Element Lists
	global.pOneList = ds_list_create();
	global.pTwoList = ds_list_create();
	
	global.pOneElementList = ds_list_create();
	global.pTwoElementList = ds_list_create();

