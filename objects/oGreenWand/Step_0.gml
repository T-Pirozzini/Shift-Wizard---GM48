/// @description Insert description here


if (global.pOneGreenSpell) {
	global.pOnePointerActive = false
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
	
	// update current tile and set animation after element collection
	var _oPlayerOneTempCurrentTile = global.pOneCurrentTile;
	var _oPlayerTwoTempCurrentTile = global.pTwoCurrentTile;
	global.pOneCurrentTile = _oPlayerTwoTempCurrentTile;
	global.pTwoCurrentTile = _oPlayerOneTempCurrentTile;
	
	global.pOneTurn = false;
	global.pOneGreenSpell = false;		 
	global.pOneCastingPhase = false;				 	 
	global.pTwoCastingPhase = true;
	global.pTwoTurn = true;		 
	}
}

if (global.pTwoGreenSpell) {
	global.pTwoPointerActive = false;
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
	
	// update current tile and set animation after element collection
	var _oPlayerOneTempCurrentTile = global.pOneCurrentTile;
	var _oPlayerTwoTempCurrentTile = global.pTwoCurrentTile;
	global.pOneCurrentTile = _oPlayerTwoTempCurrentTile;
	global.pTwoCurrentTile = _oPlayerOneTempCurrentTile;
	
	global.pTwoTurn = false
	global.pTwoGreenSpell = false;			
	global.pTwoCastingPhase = false;									
	global.pOneTurn = true;
	global.collectionPhase = true;
	global.pOneCollectionPhase = true;
	global.castingPhase = false;
	}
}
