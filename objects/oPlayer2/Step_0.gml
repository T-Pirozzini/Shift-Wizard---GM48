/// @description Occurs every frame

//Get input
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
upKey = keyboard_check(vk_up);
downKey = keyboard_check(vk_down);

//Player movement
#region
if (global.pTwoMovementActive) {
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
if (global.pTwoMovementActive) {	
	if (ds_list_size(global.pTwoList) < 5) {
		var _currentArrLength = ds_list_size(global.pTwoList);		
		if ((place_meeting(x, y, oRed)) && keyboard_check_released(vk_numpad0)) {			
			ds_list_add(global.pTwoList, "red")
			instance_create_layer(pOneElements.x + elementPositionX, pTwoElements.y, "Instances", oElementRed)
			elementPositionX += 20
		};
		if ((place_meeting(x, y, oGreen)) && keyboard_check_released(vk_numpad0)) {
			ds_list_add(global.pTwoList, "green")
			instance_create_layer(pTwoElements.x + elementPositionX, pTwoElements.y, "Instances", oElementGreen)
			elementPositionX += 20
		};
		if ((place_meeting(x, y, oYellow)) && keyboard_check_released(vk_numpad0)) {			
			ds_list_add(global.pTwoList, "yellow")
			instance_create_layer(pTwoElements.x + elementPositionX, pTwoElements.y, "Instances", oElementYellow)
			elementPositionX += 20
		};
		if (_currentArrLength < ds_list_size(global.pTwoList)) {
			// End Player Two Movement Phase
			global.pTwoMovementActive = false;
		}
	}
}	
#endregion	

	