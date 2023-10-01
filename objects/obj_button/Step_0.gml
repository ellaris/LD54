/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom))
{
	if(mouse_check_button_pressed(mb_left))
	{
		audio_play_sound(snd_button_press,2,false);
		script_execute(press_execute);
	
	}
	if(not player_hover)
	{
		audio_play_sound(snd_button_hover,2,false);
		player_hover = true;
	}
	image_index = 1;
}
else
{
	image_index = 0;
	player_hover = false;
}