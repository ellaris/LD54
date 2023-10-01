/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
//image_angle = sin(current_time/2000)*3

if(obj_control.level > 10 and moving)
{
	
	if(point_distance(x,y,target_x,target_y) < 2)
	{
		speed = 0;
		if(move_timer <=  0)
		{
			move_timer = move_interval;
			var _dir = irandom(360);
			target_x = spawn_x+lengthdir_x(move_distance,_dir);
			target_y = spawn_y+lengthdir_y(move_distance,_dir);
		}
	}
	else
	{
		direction = point_direction(x,y,target_x,target_y);
		speed = move_speed;
	}
	
	if(move_timer > 0)
		move_timer -= 1;
}