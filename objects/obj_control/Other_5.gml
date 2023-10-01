/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
{
	level += 1;
	var _points = 1;
	with(obj_sheep)
	{
		_points += 1;
		if(carry)
		{
			_points += 1;
			carry = noone;
		}
		persistent = true;
		visible = false;
	}
	power_points += _points;
}