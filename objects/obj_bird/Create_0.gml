/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

max_speed = 2;
max_turn = 2;
damage = 1;
life = 0
max_life = room_speed*10;

max_boost_speed = room_speed*2;
boost_speed = max_boost_speed;

direction = point_direction(x,y,mouse_x,mouse_y);

follow_mouse = function()
{
	var _diff = angle_difference(point_direction(x,y,mouse_x,mouse_y),direction)
	var _turn = max_turn*(1+boost_speed/max_boost_speed);
	direction += clamp(_diff, -_turn, _turn);
}