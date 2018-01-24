/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("1"))) {
	repeat (10) {
		var _d = random(360);
		var _xx = x + lengthdir_x(32,_d);
		var _yy = y + lengthdir_y(32,_d);
		
		instance_create_layer(_xx,_yy,layer,obj_enemy);
		
		
	}
}