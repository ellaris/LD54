/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
max_hp = 10;
hp = max_hp;
move_speed = 0.25;

part_particles_create(obj_control.particle_spawn_system,x,y,obj_control.particle_spawn_type,30);

audio_play_sound(snd_spawn_enemy,2,false);