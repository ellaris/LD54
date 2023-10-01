/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
{
	draw_rectangle(0,0,room_width*close_in_anim,room_height,false);
	
	
	if(level_complete)
	{
		var _loss = instance_number(obj_sheep) == 0;
		draw_set_color(c_green);
		var _str = "Sheep saved"
		if(_loss)
			_str = "Sheep Lost"
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
				_str = "Escort the Sheep to the ship >";
			break;
			case 2:
				_str = "Feed the hungry sheep";
				break;
			case 3:
				_str = "Collect valuable vases";
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
}
