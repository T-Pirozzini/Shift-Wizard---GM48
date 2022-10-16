/// @description Insert description here

// Switch from Movement to Casting Phase
if (!global.pOneMovementActive && !global.pTwoMovementActive) {
	global.movementPhase = false;
	global.castingPhase = true;
}

// Switch from Casting to Movement Phase
//if (!global.pOneCastingActive && !global.pTwoCastingActive) {
//	global.movementPhase = true;
//	global.castingPhase = false;
//}
