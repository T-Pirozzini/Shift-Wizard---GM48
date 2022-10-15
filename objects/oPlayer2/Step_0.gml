/// @description Occurs every frame

//Get input
rightKey = keyboard_check(vk_right);
leftKey = keyboard_check(vk_left);
upKey = keyboard_check(vk_up);
downKey = keyboard_check(vk_down);

//Player movement
#region
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
#endregion
	
//Collect Elements
if (array_length(global.pTwoElements) < 5) {
	if ((place_meeting(x, y, oRed)) && keyboard_check_released(vk_delete)) {
		array_push(global.pTwoElements, "red")
	};
}
	