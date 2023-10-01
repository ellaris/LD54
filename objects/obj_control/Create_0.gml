/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

//randomize();

draw_set_halign(fa_middle);
draw_set_valign(fa_center);

particle_movement_system = part_system_create(part_movement);
particle_movement_type = particle_get_info(part_movement).emitters[0].parttype.ind;

particle_spawn_system = part_system_create(part_spawn);
particle_spawn_type = particle_get_info(part_spawn).emitters[0].parttype.ind;

particle_sd_system = part_system_create(part_sd);
part_system_automatic_update(particle_sd_system,false);

audio_play_sound(snd_background_music,3,true);

spawn_cd = 0;
max_spawn_cd = room_speed*5;

close_in_timer_start = room_speed*90;
close_in_timer = close_in_timer_start;
close_in_period = room_speed*3;
close_in_distance = 0;
close_in_anim = 0;

level = 1;
power_points = 0;

enemy_spawn_cd_max = room_speed*10*5;
enemy_spawn_cd = enemy_spawn_cd_max;

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
		_spawn_pasture = max(1,5 - level div 7);
		_spawn_item = max(_spawn_sheep/2, 1.1*level - power(1/6 *level,2));
		_spawn_scarecrow = min(4, level div 4);
	}
	
	
	
	var _occupied = 0;
	spawn_object(_spawn_sheep, obj_sheep, _occupied);
	spawn_object(_spawn_pasture, obj_pasture, _occupied, layer_get_id("back"));
	spawn_object(_spawn_item, obj_item, _occupied);
	spawn_object(_spawn_scarecrow, obj_scarecrow, _occupied, layer_get_id("back"));
	
	if(level == 1)
	{
		with(obj_sheep)
		{
			food = max_food;
			x = room_width/2;
			y = room_height/2;
		}
	}
	else if (level == 2)
	{
		with(obj_sheep)
			food = 0;
	}
	else if (level == 3)
	{
		
	}
	
	
}

spawn_object = function(_num, _obj, _occupied_array, _layer = layer)
{
	var _row_length = 32;
	var _x_gen = room_width*0.8;
	var _rows = _x_gen/_row_length;
	var _cols = room_height/_row_length-1;
	if(not is_array(_occupied_array))
		_occupied_array = array_create(_rows*_cols+_rows+1);
	
	for(var i = 0; i < _num; i++)
	{
		var _coord = irandom(_rows*_cols+_rows);
		while(_occupied_array[_coord] != 0)
			_coord = irandom(_rows*_cols+_rows);
		var _instance = instance_create_layer(_row_length/2+(_coord mod _rows) * _row_length, 
			_row_length/2+(_coord div _rows) * _row_length, _layer, _obj);
		_occupied_array[_coord] = _instance;
	}
}