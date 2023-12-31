/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
{
	if(mouse_check_button_pressed(mb_left) and spawn_cd <= 0)
	{
		repeat spawn_number
		{
			var _side = irandom(1);
			var _bird_type = choose(obj_bird_obidient, obj_bird_wild);
			var _bird = instance_create_layer(_side*room_width*irandom(1)+(1-_side)*irandom(room_width),(1-_side)*room_height*irandom(1)+_side*irandom(room_height),layer,_bird_type);
			_bird.max_speed *= bird_speed;
			_bird.damage *= bird_damage;
			_bird.max_turn *= bird_turn;
			_bird.max_life *= bird_life
		}
		spawn_cd = max_spawn_cd;
	}
	
	if(level >= 5 and enemy_spawn_cd <= 0)
	{
		repeat (level div 5)
		{
			if(instance_number(obj_slime) >= instance_number(obj_sheep))
				break;
			var _side = irandom(1);
			var _enemy_type = choose(obj_slime);
			// only spawn on the left not the right
			var _enemy = instance_create_layer(_side*room_width*irandom(0)+(1-_side)*irandom(room_width),(1-_side)*room_height*irandom(1)+_side*irandom(room_height),layer,_enemy_type);

		}
		enemy_spawn_cd = enemy_spawn_cd_max/level;
	}
	if(enemy_spawn_cd > 0)
		enemy_spawn_cd -= 1;

	if(spawn_cd > 0)
		spawn_cd -= spawn_cd_reduction;
		
	if(spawn_cd > 0 and spawn_cd <= spawn_cd_reduction)
		audio_play_sound(snd_ready,2,false);
	
	if(close_in_timer > 0)
		close_in_timer -= 1;
	else if( close_in_distance < 0.9)
	{
		close_in_timer = close_in_period;
		close_in_distance += 0.1;
		audio_play_sound(snd_close_in_move,2,false);
	}
	
	if(close_in_timer <= room_speed*1.5 and close_in_distance <= 0.9)
	{
		part_system_automatic_update(particle_sd_system,true);
		part_system_position(particle_sd_system,room_width*close_in_anim,0);
	}
	else
	{
		part_system_position(particle_sd_system,-100,0);
		part_system_automatic_update(particle_sd_system,true);
	}

	if(close_in_anim < close_in_distance and close_in_distance <= 0.9)
	{
		close_in_anim = lerp(close_in_anim,close_in_distance,(0.2-(close_in_distance-close_in_anim))/4);	
	}
	
	
	level_complete = true;
	if(array_length(obj_ship.sheep_list) < 6)
	with(obj_sheep)
		if(not safe)
		{
			other.level_complete = false;
			if(other.close_in_anim == 0.9)
				instance_destroy();
		}

}