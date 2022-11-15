/// @description Insert description here

// dynamically add shuffled game board if game setup phase
if (global.gameSetup) {
	dealCards();
	// End game setup and start selection phase
	global.gameSetup = false
	global.selectionPhase = true
	global.pOneTurn = true;	
};
