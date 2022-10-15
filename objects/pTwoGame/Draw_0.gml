/// @description Insert description here

draw_text(x, y, "Player Two");
draw_text(x - 25, y + 25, "Spell Components");

//No elements in spell bag
if (ds_list_size(global.pTwoList) == 0) {
	draw_text(x, y + 50, "No Elements");
}

//spell bag full
if (ds_list_size(global.pTwoList) == 5) {
	draw_text_transformed(x, y + 75, "Spell Bag Full", .75, .75, 1);	
}
