/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
var _sheep = instance_nearest(x,y,obj_sheep);

speed = 0;
if(_sheep)
{
	direction = point_direction(x,y,_sheep.x,_sheep.y);
	speed = move_speed;
	if(instance_place(x,y,_sheep) and not _sheep.safe)
		instance_destroy(_sheep);
}

var _bird = instance_place(x,y,obj_bird);
if(_bird)
{
	hp -= _bird.damage;
	var _dir = point_direction(_bird.x,_bird.y,x,y);
	x += lengthdir_x(2,_dir);
	y += lengthdir_y(2,_dir);
	instance_destroy(_bird);
}

if(hp <= 0)
	instance_destroy()