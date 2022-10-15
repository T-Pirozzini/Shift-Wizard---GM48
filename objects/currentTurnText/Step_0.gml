/// @description Set Turns

//Stop Player Animation at end of Movement Phase
if (!global.pTwoMovementActive) {
	oPlayer2.image_index = 0;
}
if (!global.pOneMovementActive) {
	oPlayer1.image_index = 0;
}

if (!global.pOneMovementActive && !global.pTwoMovementActive && !global.pTwoCastingActive) {
	global.pOneCastingActive = true;
	global.pOnePointer = true;
}

if (!global.pOneMovementActive && !global.pOneCastingActive && !global.pTwoMovementActive) {
	global.pTwoCastingActive = true;
	global.pTwoPointer = true;
}

//Start Player One Casting Phase



//	if (!global.pOneMovementActive && !global.pOneCastingActive) {
//		global.pTwoCastingActive = true;
//	}
//}

////Player Casting
//if (global.pTwoCastingActive) {
//	//Select element to cast
//	global.pTwoPointer = true;	
//}


////End player turn
//if (!global.pOneMovementActive) {
//	image_index = 0;
//	if (!global.pTwoMovementActive && !global.pTwoCastingActive) {
//		global.pOneCastingActive = true;
//	}
//}

////Player Casting
//if (global.pOneCastingActive) {
//	//Select element to cast
//	global.pOnePointer = true;	
//}