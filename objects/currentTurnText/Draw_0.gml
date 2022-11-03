/// @description Insert description here

if (global.movementPhase && !global.pTwoMovementActive) {	
	draw_text_transformed_color(x, y, "MOVE PHASE: Player One Turn", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
}
if (global.movementPhase && !global.pOneMovementActive) {	
	draw_text_transformed_color(x, y, "MOVE PHASE: Player Two Turn", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
}

if (global.castingPhase) {
	if (global.pOneCastingActive) {	
	draw_text_transformed_color(x, y, "CASTING PHASE: Player One Turn", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
	}
}

if (global.castingPhase) {
	if (global.pTwoCastingActive) {
	draw_text_transformed_color(x, y, "CASTING PHASE: Player Two Turn", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
	}
}



// current states
//draw_text_transformed(5,260, "Movement Phase:", .75, .75,  image_angle)
//draw_text_transformed(120,260,global.movementPhase,.75, .75,  image_angle)
//draw_text_transformed(5,275,"Casting Phase:",.75, .75,  image_angle)
//draw_text_transformed(120,275,global.castingPhase, .75, .75, image_angle)

draw_text_transformed(5,300,"P1 Movement:",.75, .75,  image_angle)
draw_text_transformed(100,300,global.pOneMovementActive,.75, .75,  image_angle)
draw_text_transformed(5,320,"P1 Casting:",.75, .75,  image_angle)
draw_text_transformed(100,320,global.pOneCastingActive, .75, .75, image_angle)
draw_text_transformed(5,340,"P1 Pointer:",.75, .75,  image_angle)
draw_text_transformed(100,340,global.pOnePointerActive,.75, .75,  image_angle)



draw_text_transformed(200,300,"P2 Movement:", .75, .75, image_angle)
draw_text_transformed(320,300,global.pTwoMovementActive, .75, .75, image_angle)
draw_text_transformed(200,320, "P2 Casting:",.75, .75, image_angle)
draw_text_transformed(320,320,global.pTwoCastingActive, .75, .75, image_angle)
draw_text_transformed(200,340, "P2 Pointer:",.75, .75, image_angle)
draw_text_transformed(320,340,global.pTwoPointerActive, .75, .75, image_angle)