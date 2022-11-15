/// @description Insert description here

// SELECTION PHASE
if (global.selectionPhase) {	
	if (global.pOneSelectionPhase) {
		draw_text_transformed_color(x, y, "PLAYER ONE: Select your starting tile", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
	}
	if (global.pTwoSelectionPhase) {
		draw_text_transformed_color(x, y, "PLAYER TWO: Select your starting tile", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
	}
}

// COLLECTION PHASE
if (global.collectionPhase) {
	if (global.pOneCollectionPhase) {
		draw_text_transformed_color(x, y, "PLAYER ONE: Collect an adjacent tile", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
	}
	if (global.pTwoCollectionPhase) {
		draw_text_transformed_color(x, y, "PLAYER TWO: Collect an adjacent tile", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
	}
}

// CASTING PHASE
if (global.castingPhase) {
	if (global.pOneCastingPhase) {		
			draw_text_transformed_color(x, y, "PLAYER ONE: Cast a spell", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
	}
	if (global.pTwoCastingPhase) {		
			draw_text_transformed_color(x, y, "PLAYER TWO: Cast a spell", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
	}
}



