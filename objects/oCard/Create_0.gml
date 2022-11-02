/// @description Insert description here

animate = false;
active = false;
gameBegin = true;

// set seed to random value
randomise();
// create deck
cardDeck = ds_list_create();
// add cards to deck
ds_list_add(cardDeck, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed,)
// shuffle the deck
ds_list_shuffle(cardDeck)

