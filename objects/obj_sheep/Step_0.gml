/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_start)
	exit;
if(move_in != 0)
{
	var _change = clamp(move_in,-move_speed,move_speed);
	x += _change;
	move_in -= _change;
	if(abs(move_in) < sprite_width/4)
		safe = false;
}

if(not safe)
{
	if(x < abs(sprite_width/2))
		x = abs(sprite_width/2)
	if(x > room_width-sprite_width/2)
		x = room_width-sprite_width/2
	if(y < sprite_height/2)
		y = sprite_height/2
	if(y > room_height-sprite_height/2)
		y = room_height-sprite_height/2
		
	if(x < obj_control.close_in_anim*room_width)
		instance_destroy();
		
	if(position_meeting(x,y,obj_pasture))
	{
		if(eating)
		{
			if(food < max_food)
			{
				speed = 0;
				food += 1+max_food/room_speed/(10/move_speed);
				if(not audio_is_playing(snd_sheep_eat))
					audio_play_sound(snd_sheep_eat,2,false);
			}
			else
				eating = false;
		}
		else if (not eating and food < max_food*0.8)
		{
			eating = true;
			speed = 0;
		}
	}
	
	if(not carry)
	{
		var _item = instance_place(x,y,obj_item);
		
		if(_item and not _item.carried)
		{
			carry = _item
			_item.carried = true;
			audio_play_sound(snd_pickup,2,false);
		}
	} 
	else
	{
		carry.x = x-sprite_width/2*image_xscale;
		carry.y = bbox_top;
	}
	
	if(not eating)
	{
		var _edge = turn_from_map_edge();
		var _birds = turn_from_birds();
		var _sheep = turn_to_sheep();
		var _pasture = turn_to_pasture();

		speed = 0;
		if(_birds.x != 0 or _birds.y != 0)
		{
			direction = _birds.get_direction(move_speed);
			speed = move_speed;
		}
		else if(_edge.x != 0 or _edge.y != 0)
		{
			direction = _edge.get_direction(move_speed);
			speed = move_speed;
		}
		else if(_pasture.x != 0 or _pasture.y != 0)
		{
			direction = _sheep.get_direction(move_speed);
			speed = move_speed;
		}
		else if(_sheep.x != 0 or _sheep.y != 0)
		{
			direction = _sheep.get_direction(move_speed);
			speed = move_speed;
		}
		else 
		{
			wander += 1;
			if(wander >= max_wander)
			{
				direction = irandom(360);
				wander_speed = move_speed/4*irandom(2);
				wander = 0;
			}
			speed = wander_speed;
		}

		if(food > 0)
			food -= 1;
	}
	
	if(direction < 90 or direction > 270)
		image_xscale = 1;
	else
		image_xscale = -1;
		
	var _ship = instance_place(x,y,obj_ship);
	if(_ship and food > max_food*hunger_ratio)
	{
		var _sheep_list_length = array_length(_ship.sheep_list);
		if(_sheep_list_length  < 6 )
		{
			safe = true;
			audio_play_sound(snd_sheep_safe,2,false);
			array_push(_ship.sheep_list,id);
			//_sheep_list_length += 1;
			image_xscale = 1;
			x = _ship.bbox_left + sprite_width/2 + (_sheep_list_length mod 2) * 16;
			y = _ship.bbox_top + sprite_height*1.25 + (_sheep_list_length div 2) * 16;
			
			speed = 0;
			
		}
	}
}

if(carry)
{
	carry.x = bbox_left;
	carry.y = bbox_top;
}

if(speed != 0)
{
	image_speed = speed;
	if(food mod round(15/speed) == 1)
	{
		part_particles_create(obj_control.particle_movement_system,x,bbox_bottom,obj_control.particle_movement_type,3);	

	}
}
else
if(eating)
{
	image_speed = move_speed;
	
	if(current_time mod room_speed/5 == 0)
	{
		part_particles_create(obj_control.particle_movement_system,x,bbox_bottom,obj_control.particle_movement_type,3);	

	}
}
else
{
	image_index = 0;
	image_speed = 0;
}