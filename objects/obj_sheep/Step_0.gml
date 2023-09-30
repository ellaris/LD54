/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var _edge = turn_from_map_edge();
var _birds = turn_from_birds();
var _sheep = turn_to_sheep();

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
		speed = move_speed/4*irandom(2);
	}
}
