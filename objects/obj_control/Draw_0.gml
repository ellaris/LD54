/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
if(room == rm_game)
	draw_rectangle(0,0,room_width*close_in_anim,room_height,false);
if(room == rm_start)
{
	draw_text(16,16,"Points: "+string(power_points)+"  Map: "+string(level));
}