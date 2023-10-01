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
		speed = 0;
	}
	power_points += _points;
	part_system_position(particle_sd_system,-100,0);
	//part_system_clear(particle_sd_system);
	//part_system_automatic_update(particle_sd_system,false);
}