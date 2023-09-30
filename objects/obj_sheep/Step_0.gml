/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(not safe)
{
	if(x < obj_control.close_in_anim*room_width)
		instance_destroy();
		
	if(place_meeting(x,y,obj_pasture))
	{
		if(eating)
		{
			if(food < max_food)
			{
				speed = 0;
				food += 1+max_food/room_speed/10;
			}
			else
				eating = false;
		}
		else if (not eating and food < max_food*0.9)
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
		if(_sheep_list_length  < 10 )
		{
			safe = true;
			array_push(_ship.sheep_list,id);
			x = _ship.bbox_left+sprite_width/2+_sheep_list_length mod 2 * 16;
			y = _ship.bbox_top+sprite_height/2+_sheep_list_length div 2 * 16;
			speed = 0;
			if(carry)
			{
				carry.x = bbox_left;
				carry.y = bbox_top;
			}
		}
	}
}