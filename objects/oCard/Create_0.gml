/// @description Insert description here

animate = false;
active = false;
gameBegin = true;

// set seed to random value
randomise();
// create deck
cardDeck = ds_list_create();
objDeck = ds_list_create();
// add cards to deck
ds_list_add(cardDeck, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed, sGreen, sYellow, sRed,);
ds_list_add(objDeck, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed,)
// shuffle the deck
ds_list_shuffle(cardDeck)

