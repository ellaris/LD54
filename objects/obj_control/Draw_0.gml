/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
{
	draw_rectangle(0,0,room_width*close_in_anim,room_height,false);
	
	
	if(level_complete)
	{
		var _loss = instance_number(obj_sheep) == 0;
		draw_set_color(c_green);
		var _str = "Sheep saved\nClick to Continue"
		if(_loss)
			_str = "Sheep Lost\nClick to Restart"
		draw_text(room_width/2,room_height/2,_str)
		if(mouse_check_button_pressed(mb_left))
		{
			if(_loss)
				game_restart();
			else
				room_goto(rm_start);
		}
		draw_set_color(c_white);
		with(obj_ship)
		{
			direction = 90;
			speed = speed*1.02;
			if(speed == 0)
				speed = 0.05;
			if(y+sprite_height < 0)
				speed = 0;
				
			for(var i = 0; i < array_length(sheep_list); i++)
			{
				var _sheep = sheep_list[i];
				_sheep.direction = 90;
				_sheep.speed = speed;
				//if(_sheep.carry)
			}
		}
	}
	else
	{
		var _str = "tutorial"
		switch(level)
		{
			case 1:
				_str = "Escort the Sheep to the ship >\nBirds fly towards cursor and herd sheep";
			break;
			case 2:
				_str = "Feed the hungry sheep\nIf the sheep is hungry it won't board the ship";
				break;
			case 3:
				_str = "Collect valuable vases\nThe sheep can carry a vase";
				break;
			case 4:
				_str = "After Some time the white plague will limit your space\nThe Ship also has limited space and can carry 6 sheep";
				break;
			case 5:
				_str = "Slimes are after your sheep, repel them with your birds";
				break;
			default:
				_str = "";
		}
		
		draw_set_color(c_green);
		draw_text(room_width/2,room_height/2,_str);
	}
	draw_set_color(c_white);
}
if(room == rm_start)
{
	draw_text(96,16,"Points: "+string(power_points)+"  Map: "+string(level));
	var _str = ""
	if(level == 4)
		_str = "Spend your points to upgrade birds:\n cooldown, damage, quantity, speed, turn, duration";
	
	draw_set_color(c_green);
	draw_text(room_width/2,room_height/2,_str);
}
