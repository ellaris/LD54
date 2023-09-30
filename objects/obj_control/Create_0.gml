/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

spawn_cd = 0;
max_spawn_cd = room_speed*5;

close_in_timer = room_speed*90;
close_in_period = room_speed*3;
close_in_distance = 0;
close_in_anim = 0;

level = 1;
power_points = 5;


initial_spawn_cd_reduction = 1; // 10%
initial_bird_damage = 1; // 10%
initial_spawn_number = 3; // 1
initial_bird_speed = 1; // 10%
initial_bird_turn = 1; // 10%
initial_bird_life = 1 // 10%

spawn_cd_reduction = initial_spawn_cd_reduction; // 10%
bird_damage = initial_bird_damage; // 10%
spawn_number = initial_spawn_number; // 1
bird_speed = initial_bird_speed; // 10%
bird_turn = initial_bird_turn; // 10%
bird_life = initial_bird_life; // 10%

level_complete = false;

generate_map = function()
{
	var _spawn_sheep = 1;
	var _spawn_pasture = 1;
	var _spawn_scarecrow = 0;
	var _spawn_item = 0;
	
	if(level == 1)
	{
		
	}
	else if (level == 2)
	{
		
	}
	else if (level == 3)
	{
		_spawn_item = 1;
	}
	else
	{
		_spawn_sheep = min(level div 3,10);
		_spawn_pasture = max(1,3 - level div 5);
		_spawn_item = max(_spawn_sheep/2, 1.1*level - power(1/6 *level,2));
		_spawn_scarecrow = min(4, level div 6);
	}
	
	
	
	var _occupied = 0;
	spawn_object(_spawn_sheep, obj_sheep, _occupied);
	spawn_object(_spawn_pasture, obj_pasture, _occupied);
	spawn_object(_spawn_item, obj_item, _occupied);
	spawn_object(_spawn_scarecrow, obj_scarecrow, _occupied);
	
	if(level == 1)
	{
		with(obj_sheep)
			food = max_food;
	}
	else if (level == 2)
	{
		with(obj_sheep)
			food = 0;
	}
	else if (level == 3)
	{
		_spawn_item = 1;
	}
	
	
}

spawn_object = function(_num, _obj, _occupied_array)
{
	var _row_length = 32;
	var _x_gen = room_width*0.8;
	var _rows = _x_gen/_row_length;
	var _cols = room_height/_row_length;
	if(not is_array(_occupied_array))
		_occupied_array = array_create(_rows*_cols+_rows);
	
	for(var i = 0; i < _num; i++)
	{
		var _coord = irandom(_rows*_cols+_rows);
		while(_occupied_array[_coord] != 0)
			_coord = irandom(_x_gen*_cols+_x_gen);
		var _instance = instance_create_layer(_row_length/2+(_coord mod _rows) * _row_length, 
			_row_length/2+(_coord div _rows) * _row_length, layer, _obj);
		_occupied_array[_coord] = _instance;
	}
}