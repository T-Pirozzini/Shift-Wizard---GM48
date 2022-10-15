/// @description Insert description here

if (global.pOneMovementActive || global.pTwoMovementActive) {
	draw_text(x, y, "Simultaneous Play: Choose an Element")
}
if (global.pOneCastingActive) {
	draw_text(x, y, "Player One Turn: Cast an Element")
}
if (global.pTwoCastingActive) {
	draw_text(x, y, "Player Two Turn: Cast an Element")
}
if (global.endRound) {
	draw_text(x, y, "Round One Complete!")
}


// current states
draw_text(5,250, "P1 Movement:")
draw_text(130,250, global.pOneMovementActive)
draw_text(5,270, "P1 Casting:")
draw_text(130,270, global.pOneCastingActive)
draw_text(5,290, "P1 Pointer:")
draw_text(130,290, global.pOnePointer)

draw_text(500,250, "P2 Movement:")
draw_text(620,250, global.pTwoMovementActive)
draw_text(500,270, "P2 Casting:")
draw_text(620,270, global.pTwoCastingActive)
draw_text(500,290, "P2 Pointer:")
draw_text(620,290, global.pTwoPointer)