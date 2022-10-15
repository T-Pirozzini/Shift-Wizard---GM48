/// @description Insert description here

if (global.pOneMovementActive && global.pTwoMovementActive) {
	draw_text(x, y, "Simultaneous Play: Choose an Element")
}

if (global.pOneCastingActive && !global.pTwoCastingActive) {
	draw_text(x, y, "Player One Turn: Cast an Element")
}
if (!global.pOneCastingActive && global.pTwoCastingActive) {
	draw_text(x, y, "Player Two Turn: Cast an Element")
}