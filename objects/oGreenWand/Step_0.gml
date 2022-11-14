/// @description Insert description here


if (global.pOneGreenSpell) {
	if (keyboard_check(vk_lshift)) {
	
	// get current player positions & then swap positions
	var _oPlayerOneTempX = oPlayer1.x
	var _oPlayerOneTempY = oPlayer1.y	
	oPlayer1.x = oPlayer2.x
	oPlayer1.y = oPlayer2.y	
	oPlayer2.x = _oPlayerOneTempX
	oPlayer2.y = _oPlayerOneTempY
	
	// remove green spell instances
	instance_destroy(oGreenWand)
	instance_destroy(oGreenInstructions)
	
	////get id of current tile instances
	//var _instP1 = instance_place(oPlayer1.x, oPlayer1.y, oGameBoard)
	//var _instP2 = instance_place(oPlayer2.x, oPlayer2.y, oGameBoard)
	//// update current tile of players
	//global.pOneCurrentTile = _instP1;
	//global.pTwoCurrentTile = _instP2;
	//setCardAnimation(_instP1)
	//setCardAnimation(_instP2)
	
	global.pOneGreenSpell = false;
	global.pOneCastingActive = false;
	global.currentlyCasting = false;	
	global.pTwoCastingActive = true;	 
	}
}

if (global.pTwoGreenSpell) {
	if (keyboard_check(vk_numpad0)) {	
	
	// get current player positions & then swap positions
	var _oPlayerOneTempX = oPlayer1.x
	var _oPlayerOneTempY = oPlayer1.y	
	oPlayer1.x = oPlayer2.x
	oPlayer1.y = oPlayer2.y
	oPlayer2.x = _oPlayerOneTempX
	oPlayer2.y = _oPlayerOneTempY
	
	// remove green spell instances
	instance_destroy(oGreenWand)
	instance_destroy(oGreenInstructions)
	
	////get id of current tile instances
	//var _instP1 = instance_place(oPlayer1.x, oPlayer1.y, oGameBoard)
	//var _instP2 = instance_place(oPlayer2.x, oPlayer2.y, oGameBoard)
	//// update current tile of players
	//global.pOneCurrentTile = _instP1;
	//global.pTwoCurrentTile = _instP2;
	//setCardAnimation(_instP1)
	//setCardAnimation(_instP2)
	
	global.pTwoGreenSpell = false;
	global.pTwoCastingActive = false;
	global.currentlyCasting = false;			
	global.pOneTurn = true;
	}
}
