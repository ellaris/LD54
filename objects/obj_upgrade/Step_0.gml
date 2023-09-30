/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(point_in_rectangle(mouse_x,mouse_y,bbox_right+sprite_width/2,bbox_top,bbox_right+sprite_width*1.5,bbox_bottom))
{
	if(obj_control.power_points >= cost and mouse_check_button_pressed(mb_left))
	{
		obj_control.power_points -= cost;
		cost += 1;
		var _initial = variable_instance_get(obj_control,variable_initial);
		var _change = _initial*increment;
		var _current = variable_instance_get(obj_control, variable_name)
		variable_instance_set(obj_control, variable_name, _current+_change);
	}
}