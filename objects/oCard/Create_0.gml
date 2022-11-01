/// @description Insert description here

animate = false;
active = false;

// set seed to random value
randomise();
// create deck
deck = ds_list_create();
// add cards to deck
ds_list_add(deck, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed,);
// shuffle the deck
ds_list_shuffle(deck)