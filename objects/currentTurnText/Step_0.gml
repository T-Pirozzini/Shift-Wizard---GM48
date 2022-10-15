/// @description Set Turns

//Stop Player Animation at end of Movement Phase
if (!global.pTwoMovementActive) {
	oPlayer2.image_index = 0;
}
if (!global.pOneMovementActive) {
	oPlayer1.image_index = 0;
}

//Player One Casting Phase
if (!global.pOneMovementActive && !global.pTwoMovementActive && !global.pTwoCastingActive) {
	global.pOneCastingActive = true;
	global.pOnePointer = true;
}

//Player Two Casting Phase
if (!global.pOneMovementActive && !global.pOneCastingActive && !global.pTwoMovementActive) {
	global.pTwoCastingActive = true;
	global.pTwoPointer = true;
}

//End Round One
if (!global.pOneCastingActive && !global.pOneMovementActive && !global.pTwoCastingActive && !global.pTwoMovementActive) {
	global.endRound = true
}

