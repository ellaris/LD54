// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function instance_nearest_notself(_obj){
	var _nearest = {id: noone, dist: 1000};
	with(_obj)
	{
		var _dist = point_distance(x,y,other.x,other.y);
		if(id != other.id and id != _nearest.id and _dist < _nearest.dist)
		{
			_nearest.id = id;
			_nearest.dist = _dist;
		}
	}
	
	return(_nearest);
}

function Vector2(_x = 0,_y = 0) constructor
{
	x = _x;
	y = _y;
	
	static add = function(_vec2)
	{
		x += _vec2.x;
		y += _vec2.y;
	}
	
	static mult = function(_scalar)
	{
		x *= _scalar;
		y *= _scalar;
	}
	
	
	static get_direction = function(_speed = 1)
	{

		var _dir = point_direction(0,0,x,y);
		var _x = lengthdir_x(_speed,_dir);
		var _y = lengthdir_y(_speed,_dir);
		return( point_direction(0, 0, _x, _y));
	}
}

function go_to_game_room()
{
	room_goto(rm_game);	
}