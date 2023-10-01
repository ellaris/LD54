/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

move_speed = 1;
safe = false;
carry = noone;
carry_capacity = 1;
eating = false;

wander = 0;
max_wander = room_speed*2;
wander_speed = 0;
move_in = 0;

max_food = room_speed*60;
food = irandom(max_food);
hunger_ratio = 0.3;

//max_sleep = room_speed*60;
//sleep = irandom(max_sleep);

map_sight_distance = 64;
bird_sight_distance = 64;
sheep_cozy_distance = 48;
pasture_sight_distance = 48;
item_sight_distance = 48;
ship_sight_distance = 48;

turn_from_map_edge = function()
{
	var _v = new Vector2();
	if(x-map_sight_distance < 0)
		_v.x = room_width/2-x;
	if(x+map_sight_distance > room_width)
		_v.x = room_width/2-x;
		
	if(y-map_sight_distance < 0)
		_v.y = room_height/2-y;
	if(y+map_sight_distance > room_height)
		_v.y = room_height/2-y;
		
	return(_v);
}

turn_from_birds = function()
{
	var _v = new Vector2();
	//move away from the birds
	with(obj_bird)
	{
		var _dist = point_distance(x,y,other.x,other.y)
		if(_dist <= other.bird_sight_distance)
		{
			_v.add(new Vector2(other.x-x,other.y-y));
		}
	}
	
	return(_v);
}

turn_to_sheep = function()
{
	var _v = new Vector2();
	var _nearest = instance_nearest_notself(obj_sheep);
	if(_nearest.id)
	{
		if(_nearest.dist > sheep_cozy_distance)
		{
			_v.add(new Vector2(_nearest.id.x-x,_nearest.id.y-y));
		}
		else if (_nearest.dist <= sprite_width)
		{
			_v.add(new Vector2(x-_nearest.id.x,y-_nearest.id.y));	
		}
	}
	return(_v);
}

turn_to_pasture = function()
{
	var _v = new Vector2();
	//move away from the birds
	with(obj_pasture)
	{
		var _dist = point_distance(x,y,other.x,other.y)
		if(_dist <= other.pasture_sight_distance)
		{
			_v.add(new Vector2(x-other.x,y-other.y));
		}
	}
	
	return(_v);
}