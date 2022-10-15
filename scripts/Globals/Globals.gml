// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Player Phase States
	//Player One
	global.pOneMovementActive = true; 
	global.pOneCastingActive = false;
	global.pOnePointer = false;

	// Player Two
	global.pTwoMovementActive = true;
	global.pTwoCastingActive = false;
	global.pTwoPointer = false;


// Stored Element Lists
global.pOneList = ds_list_create();
ds_list_add(global.pOneList, "yellow", "green")

global.pTwoList = ds_list_create();
ds_list_add(global.pTwoList, "red", "green")

