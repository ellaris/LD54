/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(obj_control.power_points >= cost and point_in_rectangle(mouse_x,mouse_y,bbox_right+sprite_width/2,bbox_top,bbox_right+sprite_width*1.5,bbox_bottom))
{
	if( mouse_check_button_pressed(mb_left))
	{
		obj_control.power_points -= cost;
		cost += 1;
		var _initial = variable_instance_get(obj_control,variable_initial);
		var _change = _initial*increment;
		var _current = variable_instance_get(obj_control, variable_name)
		variable_instance_set(obj_control, variable_name, _current+_change);
		audio_play_sound(snd_button_press,2,false);
	}
	if(not played_hover)
	{
	audio_play_sound(snd_button_hover,2,false);
	played_hover = true;
	}
}
else
	played_hover = false;