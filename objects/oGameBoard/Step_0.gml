/// @description Insert description here

// dynamically add shuffled game board if game setup phase
if (global.gameSetup) {
	dealCards();
	global.gameSetup = false
}

if (!global.selectionPhase) {
 animate = false;
}


