/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_self();

if(not safe)
{
	if(food <= max_food*hunger_ratio or eating)
		draw_sprite(spr_icon,0,x,bbox_top-8)
}
else
	draw_sprite(spr_icon,1,x,bbox_top-8)