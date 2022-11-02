/// @description Insert description here

if (global.selectionPhase) {	
	if (global.p1SelectStartingTile) {
		draw_text_transformed_color(x, y, "SELECT YOUR STARTING TILE: Player One", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
	}
	if (global.p2SelectStartingTile) {
		draw_text_transformed_color(x, y, "SELECT YOUR STARTING TILE: Player One", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
	}
}
