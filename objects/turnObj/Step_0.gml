/// @description Insert description here

// MAIN
if (global.pOneTurn) {
	global.pTwoMovementActive = false;
}
if (global.pTwoTurn) {
	global.pOneMovementActive = false;
}


// SELECTION PHASE
if (global.selectionPhase) {
	if (global.pOneSelectionPhase) {
		global.pOneMovementActive = true;		
	}
	if (global.pTwoSelectionPhase) {
		global.pTwoMovementActive = true;		
	}
}

// COLLECTION PHASE
if (global.collectionPhase) {
	if (global.pOneCollectionPhase) {
		global.pOneMovementActive = true;
	}
	if (global.pTwoCollectionPhase) {
		global.pTwoMovementActive = true;
	}
}

// CASTING PHASE
if (global.castingPhase) {
	if (global.pOneCastingPhase) {
		global.pOneMovementActive = false;
	}
	if (global.pTwoCastingPhase) {
		global.pTwoMovementActive = false;
	}
}