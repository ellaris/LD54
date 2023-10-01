/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
event_inherited();

image_blend = c_green;

move_speed = 3;

follow_mouse = function()
{
	var _scarecrow = turn_from_scarecrow();
	var _diff = angle_difference(point_direction(x,y,mouse_x,mouse_y)+sign(sin(life/room_speed))*30,direction)
	var _turn = max_turn*(1+boost_speed/max_boost_speed);
	if(_scarecrow.x != 0 or _scarecrow.y != 0)
		_diff = angle_difference(_scarecrow.get_direction(),direction);
	direction += clamp(_diff, -_turn, _turn);
}