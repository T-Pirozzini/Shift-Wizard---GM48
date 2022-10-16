/// @description Insert description here

// Switch from Movement to Casting Phase
if (!global.pOneMovementActive && !global.pTwoMovementActive) {
	global.movementPhase = false;
	global.castingPhase = true;
}
if (global.pOneMovementActive) {
	global.movementPhase = true;
	global.castingPhase = false;
}


//if (global.castingPhase) {
//	if (!global.pOneCastingActive && !global.pTwoCastingActive && !global.pOnePointerActive && !global.pTwoPointerActive) {
//		global.movementPhase = true;
//		global.castingPhase = false;
//	}
//}


