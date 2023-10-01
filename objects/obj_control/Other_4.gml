/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
{
	close_in_timer = close_in_timer_start;
	for(var i = 0; i < instance_number(obj_sheep); i++)
	{
		var _sheep = instance_find(obj_sheep, i);
		_sheep.y = room_height/2;
		_sheep.x = -16-24*i
		_sheep.move_in = -_sheep.x;
		_sheep.persistent = false;
		_sheep.visible = true;
	}
	generate_map();
	enemy_spawn_cd = enemy_spawn_cd_max;
	if(level == 5)
	{
		var _enemy = instance_create_layer(irandom(room_width),choose(0,room_height),layer,obj_slime);
		_enemy.hp = 2;
	}
}

spawn_cd = 0;
close_in_distance = 0;
close_in_anim = 0;

//if(room = rm_start)
//	room_goto(rm_game)