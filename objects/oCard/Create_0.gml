/// @description Insert description here

// set seed to random value
randomise();
// create deck
cardDeck = ds_list_create();
// add cards to deck
ds_list_add(cardDeck, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oGreen, oYellow, oRed, oPoint, oRed)
// shuffle the deck
ds_list_shuffle(cardDeck)
// get current size of deck
deckSize = ds_list_size(cardDeck)



