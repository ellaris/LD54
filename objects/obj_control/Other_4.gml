/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
{
	close_in_timer = room_speed*90;
	for(var i = 0; i < instance_number(obj_sheep); i++)
	{
		var _sheep = instance_find(obj_sheep, i);
		_sheep.y = room_height/2;
		_sheep.x = -16-20*i
		_sheep.move_in = -_sheep.x;
		_sheep.persistent = false;
		_sheep.visible = true;
	}
	generate_map();
}

spawn_cd = 0;
close_in_distance = 0;
close_in_anim = 0;

//if(room = rm_start)
//	room_goto(rm_game)