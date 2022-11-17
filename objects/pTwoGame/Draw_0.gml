/// @description Insert description here

draw_text_transformed_color(x, y, "PLAYER TWO", 1, 1, image_angle, c_red, c_red, c_orange, c_orange, 1);
draw_text(x - 25, y + 25, "Spell Components");

//No elements in spell bag
if (ds_list_size(global.pTwoElementList) == 0) {
	draw_text(x, y + 50, "No Elements");
}

//spell bag full
if (ds_list_size(global.pTwoElementList) == 5) {
	draw_text_transformed(x, y + 75, "Spell Bag Full", 1, 1, 1);	
}
