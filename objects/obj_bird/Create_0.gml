/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

max_speed = 2;
max_turn = 3;
damage = 1;
life = 0
max_life = room_speed*10;

max_boost_speed = room_speed*2;
boost_speed = max_boost_speed;
scarecrow_sight_distance = 64;

direction = point_direction(x,y,mouse_x,mouse_y);

part_particles_create(obj_control.particle_spawn_system,x,y,obj_control.particle_spawn_type,10);

if(not audio_is_playing(snd_spawn_bird))
	audio_play_sound(snd_spawn_bird,2,false);

follow_mouse = function()
{
	var _scarecrow = turn_from_scarecrow();
	var _diff = angle_difference(point_direction(x,y,mouse_x,mouse_y),direction)
	var _turn = max_turn*(1+boost_speed/max_boost_speed);
	if(_scarecrow.x != 0 or _scarecrow.y != 0)
		_diff = angle_difference(_scarecrow.get_direction(),direction);
	direction += clamp(_diff, -_turn, _turn);
}

turn_from_scarecrow = function()
{
	var _v = new Vector2();
	//move away from the scarecrow
	with(obj_scarecrow)
	{
		var _dist = point_distance(x,y,other.x,other.y)
		if(_dist <= other.scarecrow_sight_distance)
		{
			_v.add(new Vector2(other.x-x,other.y-y));
		}
	}
	
	return(_v);	
}