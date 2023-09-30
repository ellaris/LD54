/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
draw_self();

if(obj_control.power_points >= cost)
{
	var _c = image_blend;
	if(point_in_rectangle(mouse_x,mouse_y,bbox_right+sprite_width/2,bbox_top,bbox_right+sprite_width*1.5,bbox_bottom))
		_c = c_green;
	draw_sprite_ext(spr_icon, 7,bbox_right+sprite_width,y,image_xscale,image_yscale,image_angle,_c,image_alpha);
}	
var _current = variable_instance_get(obj_control, variable_name);
var _initial = variable_instance_get(obj_control, variable_initial);
var _proc = round(_current/_initial*100);
		
draw_text(x,bbox_bottom+sprite_height/2,_proc);