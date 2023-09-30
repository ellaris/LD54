/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(mouse_check_button_pressed(mb_left) and spawn_cd <= 0)
{
	repeat spawn_number
	{
		var _side = irandom(1);
		var _bird = instance_create_layer(_side*room_width*irandom(1)+(1-_side)*irandom(room_width),(1-_side)*room_height*irandom(1)+_side*irandom(room_height),layer,obj_bird);
		_bird.max_speed *= bird_speed;
		_bird.damage *= bird_damage;
		_bird.max_turn *= bird_turn;
	}
	spawn_cd = max_spawn_cd;
}

if(spawn_cd > 0)
	spawn_cd -= spawn_cd_reduction;
	
if(close_in_timer > 0)
	close_in_timer -= 1;
else
{
	close_in_timer = close_in_period;
	close_in_distance += 0.1;
}

if(close_in_anim < close_in_distance)
{
	close_in_anim = lerp(close_in_anim,close_in_distance,(0.2-(close_in_distance-close_in_anim))/4);	
}