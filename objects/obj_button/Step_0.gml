/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom))
{
	if(mouse_check_button_pressed(mb_left))
	{
		script_execute(press_execute);
	
	}
	image_index = 1;
}
else
	image_index = 0;