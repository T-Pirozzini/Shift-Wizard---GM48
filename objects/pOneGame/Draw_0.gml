/// @description Insert description here

draw_text_transformed_color(x, y, "PLAYER ONE", 1, 1, image_angle, c_blue, c_blue, c_aqua, c_aqua, 1);
draw_text(x - 25, y + 25, "Spell Components");

//No elements in spell bag
if (ds_list_size(global.pOneElementList) == 0) {
	draw_text_transformed(x, y + 50, "No Elements", 1, 1, 1);
	
}

//spell bag full
if (ds_list_size(global.pOneElementList) == 5) {
	draw_text_transformed(x, y + 75, "Spell Bag Full", 1, 1, 1);	
}