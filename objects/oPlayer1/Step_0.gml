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
#region
if (global.movementPhase) {	
	if (global.pOneMovementActive) {
	if (ds_list_size(global.pOneList) < 5) {
		//save current list size
		var _currentArrLength = ds_list_size(global.pOneList);
		//check if playerOne is on redCard
		if ((place_meeting(x, y, oRed)) && keyboard_check_released(vk_lshift)) {			
			ds_list_add(global.pOneList, "red")
			//create redElement on Instances layer
			instance_create_layer(pOneElements.x + elementPositionX, pOneElements.y, "Instances", oElementRed)
			elementPositionX += 20;			
		};
		//check if playerOne is on greenCard
		if ((place_meeting(x, y, oGreen)) && keyboard_check_released(vk_lshift)) {
			ds_list_add(global.pOneList, "green")
			instance_create_layer(pOneElements.x + elementPositionX, pOneElements.y, "Instances", oElementGreen)
			elementPositionX += 20;			
		};
		//check if playerOne is on yellowCard
		if ((place_meeting(x, y, oYellow)) && keyboard_check_released(vk_lshift)) {			
			ds_list_add(global.pOneList, "yellow")
			instance_create_layer(pOneElements.x + elementPositionX, pOneElements.y, "Instances", oElementYellow)
			elementPositionX += 20;			
		};
		if (_currentArrLength < ds_list_size(global.pOneList)) {
			// End Player One Movement Phase
			global.pOneMovementActive = false;
			global.pTwoMovementActive = true;
		}
	}
	}
}
#endregion

if (!global.pOneMovementActive) {
	oPlayer1.image_index = 0;
}
	
