/// @description Initialize Variables

//Movement
	moveDir = 0;
	moveSpd = 1;
	xspd = 0;
	yspd = 0;
	
//Sprite Control
	face = 3;
	sprite[0] = sPlayerRight;
	sprite[1] = sPlayerUp;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerDown;
	
global.pOneMovementActive = false; // set to true for actual gameplay

global.pOneCastingActive = false; 