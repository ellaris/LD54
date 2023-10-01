/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
speed = max_speed*(1+boost_speed/max_boost_speed);
image_speed = speed;

follow_mouse()

life += 1;
if(life >= max_life)
	instance_destroy();

if(boost_speed)
	boost_speed -= 1;
	
if((life mod round(20/speed)) == 1)
{
		part_particles_create(obj_control.particle_movement_system,x,bbox_bottom,obj_control.particle_movement_type,3);	
}