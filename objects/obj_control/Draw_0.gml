/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
	draw_rectangle(0,0,room_width*close_in_anim,room_height,false);
if(room == rm_start)
{
	draw_text(16,16,"Points: "+string(power_points)+"  Map: "+string(level));
}

if(level_complete)
{
	draw_set_color(c_black);
	draw_text(room_width/2,room_height/2,"Map Complete")
	if(mouse_check_button_pressed(mb_left))
		room_goto(rm_start);
	draw_set_color(c_white);
}