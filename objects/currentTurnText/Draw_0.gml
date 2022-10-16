/// @description Insert description here

if (global.movementPhase && !global.pTwoMovementActive) {
	draw_text(x, y, "Move Phase: Player One Turn")
}
if (global.movementPhase && !global.pOneMovementActive) {
	draw_text(x, y, "Move Phase: Player Two Turn")
}

if (global.castingPhase) {
	if (global.pOneCastingActive) {
	draw_text(x, y, "Casting Phase: Player One Turn")
	}
}

if (global.castingPhase) {
	if (global.pTwoCastingActive) {
	draw_text(x, y, "Casting Phase: Player Two Turn")
	}
}



// current states
draw_text(5,225, "Movement Phase:")
draw_text(140,225, global.movementPhase)
draw_text(5,250, "P1 Movement:")
draw_text(130,250, global.pOneMovementActive)
draw_text(5,270, "P1 Casting:")
draw_text(130,270, global.pOneCastingActive)
draw_text(5,290, "P1 Pointer:")
draw_text(130,290, global.pOnePointerActive)

draw_text(500,225, "Casting Phase:")
draw_text(630,225, global.castingPhase)
draw_text(500,250, "P2 Movement:")
draw_text(620,250, global.pTwoMovementActive)
draw_text(500,270, "P2 Casting:")
draw_text(620,270, global.pTwoCastingActive)
draw_text(500,290, "P2 Pointer:")
draw_text(620,290, global.pTwoPointerActive)