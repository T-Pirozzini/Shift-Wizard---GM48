/// @description Insert description here


if (global.pOneGreenSpell) {	
	var _oPlayerOneTempX = oPlayer1.x
	var _oPlayerOneTempY = oPlayer1.y
	
	oPlayer1.x = oPlayer2.x
	oPlayer1.y = oPlayer2.y
	
	oPlayer2.x = _oPlayerOneTempX
	oPlayer2.y = _oPlayerOneTempY
	global.pOneGreenSpell = false;
	global.pTwoCastingActive = true;
	global.pTwoPointerActive = true;
}
