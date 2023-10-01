/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
event_inherited();

var _hp_scale = 0.5;
var _scale = hp/max_hp/_hp_scale+(1-_hp_scale);

image_xscale = _scale;
image_yscale = _scale;

if(speed != 0)
	speed = move_speed*_scale;