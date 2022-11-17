/// @description Insert description here

if (keyboard_check(vk_space)) {
	 room_goto(rm_game);
	 audio_play_sound(snd_theme, 1, true, 10)
}
