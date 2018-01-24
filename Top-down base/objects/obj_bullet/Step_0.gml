/// @description Step

x += xspeed;
y += yspeed;
var _tilemap = obj_controller.col_map;

if (tilemap_get_at_pixel(_tilemap,x,y) >= 67) {
	instance_destroy();	
}

if (dmg <= 0) {
	instance_destroy();
}