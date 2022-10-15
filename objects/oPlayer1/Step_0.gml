/// @description Occurs every frame

//Get input
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));

//Player movement
#region
if (global.pOneMovementActive) {
	xspd = moveSpd * (rightKey - leftKey); // if right = 1, if left = -1, if both pressed = 0 (no movement)
	yspd = (downKey - upKey); // top left is coord (0,0) - moving down increases y-axis

	if (yspd == 0) {	// x facing and accounting for diagonal movement
		if (xspd > 0) {
		 face = 0
		};
		if (xspd < 0) {
		 face = 2
		};
	};
	if (xspd > 0 && face == 2) {
		face = 0
	};
	if (xspd < 0 && face == 0) {
		face = 2
	};

	if (xspd == 0) { // y facing and accounting for diagonal movement
		if (yspd > 0) {
		 face = 3
		};
		if (yspd < 0) {
		 face = 1
		};
	};
	if (yspd > 0 && face == 1) {
		face = 3
	};
	if (yspd < 0 && face == 3) {
		face = 1
	};

	sprite_index = sprite[face];

		// move the player
		x += xspd;
		y += yspd;	
	
		//animate
		if (xspd == 0 && yspd == 0) {		
			image_index = 0;		
		};
	
		// depth
	depth = -bbox_bottom;
}
#endregion

//Collect Elements
if (global.pOneMovementActive) {	
	if (ds_list_size(global.pOneList) < 5) {
		var _currentArrLength = ds_list_size(global.pOneList);		
		if ((place_meeting(x, y, oRed)) && keyboard_check_released(vk_lshift)) {			
			ds_list_add(global.pOneList, "red")
			instance_create_layer(opOneElements.x + elementPositionX, opOneElements.y, "Instances", oElementRed)
			elementPositionX += 10
		};
		if ((place_meeting(x, y, oGreen)) && keyboard_check_released(vk_lshift)) {
			ds_list_add(global.pOneList, "green")
			instance_create_layer(opOneElements.x + elementPositionX, opOneElements.y, "Instances", oElementGreen)
			elementPositionX += 10
		};
		if ((place_meeting(x, y, oYellow)) && keyboard_check_released(vk_lshift)) {			
			ds_list_add(global.pOneList, "yellow")
			instance_create_layer(opOneElements.x + elementPositionX, opOneElements.y, "Instances", oElementYellow)
			elementPositionX += 10
		};
		if (_currentArrLength < ds_list_size(global.pOneList)) {
			global.pOneMovementActive = false;
		}
	}
}	
	
//End player turn
if (!global.pOneMovementActive) {
	image_index = 0;
	//if (!global.pTwoMovementActive && !global.pTwoCastingActive) {
		global.pOneCastingActive = true;
	}
//}

//Player Casting
if (global.pOneCastingActive) {
	//Select element to cast
	global.pOnePointer = true;	
}