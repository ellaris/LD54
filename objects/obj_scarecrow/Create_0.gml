/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
move = false;
image_xscale = 1+irandom(1)*-2;

spawn_x = x;
spawn_y = y;

moving = irandom(1);
move_interval = room_speed*6;
move_timer = move_interval;

target_x = x;
target_y = y;
move_speed = 0.25;
move_distance = 32;