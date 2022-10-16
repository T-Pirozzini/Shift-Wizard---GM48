/// @description Insert description here


if (global.pOneGreenSpell) {
	if (keyboard_check(vk_lshift)) {
	var _oPlayerOneTempX = oPlayer1.x
	var _oPlayerOneTempY = oPlayer1.y
	
	oPlayer1.x = oPlayer2.x
	oPlayer1.y = oPlayer2.y
	
	oPlayer2.x = _oPlayerOneTempX
	oPlayer2.y = _oPlayerOneTempY
	instance_destroy(oGreenWand)
	
	global.pOneGreenSpell = false;
	global.pTwoCastingActive = true;
	global.pTwoPointerActive = true;
	global.gameStart = true
	}
}

if (global.pTwoGreenSpell) {
	if (keyboard_check(vk_numpad0)) {
	var _oPlayerOneTempX = oPlayer1.x
	var _oPlayerOneTempY = oPlayer1.y
	
	oPlayer1.x = oPlayer2.x
	oPlayer1.y = oPlayer2.y
	
	instance_destroy(oGreenWand)
	
	oPlayer2.x = _oPlayerOneTempX
	oPlayer2.y = _oPlayerOneTempY
	global.pTwoGreenSpell = false;
	global.pOneMovementActive = true;
	global.gameStart = true
	}
}
