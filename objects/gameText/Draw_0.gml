/// @description Insert description here

if (global.selectionPhase) {	
	if (global.pOneSelectionPhase) {
		draw_text_transformed_color(x, y, "SELECT YOUR STARTING TILE: Player One", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
	}
	if (global.pTwoSelectionPhase) {
		draw_text_transformed_color(x, y, "SELECT YOUR STARTING TILE: Player Two", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
	}
}


if (global.pOneTurn) {		
		draw_text_transformed_color(x, y, "PLAYER ONE TURN", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
}

if (global.pTwoTurn) {		
		draw_text_transformed_color(x, y, "PLAYER TWO TURN", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
}



