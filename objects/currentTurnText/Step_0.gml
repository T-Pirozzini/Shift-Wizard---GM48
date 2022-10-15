/// @description Set Turns

//Player One Movement Phase
if (!global.pOneCastingActive && !global.pTwoCastingActive) {
	 global.pOneMovementActive = true;
	 global.pTwoMovementActive = true;
}

//Stop Player Animation at end of Movement Phase
if (!global.pTwoMovementActive) {
	oPlayer2.image_index = 0;
}
if (!global.pOneMovementActive) {
	oPlayer1.image_index = 0;
}

//Player One Casting Phase
if (!global.pOneMovementActive && !global.pTwoMovementActive && !global.pTwoCastingActive && !global.pTwoPointer) {
	global.pOneCastingActive = true;
	global.pOnePointer = true;
}

//Player Two Casting Phase
if (!global.pTwoMovementActive && !global.pOneMovementActive && !global.pOneCastingActive && !global.pOnePointer) {
	global.pTwoCastingActive = true;
	global.pTwoPointer = true;
}


