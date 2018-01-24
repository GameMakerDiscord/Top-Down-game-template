/// @description Movement

#region Controls

var _accel = 1;
var _maxspeed = 4;
var _ud = keyboard_check(key_down)-keyboard_check(key_up);
var _lr = keyboard_check(key_right)-keyboard_check(key_left);

#endregion

#region Movement

dir = point_direction(x,y,mouse_x,mouse_y);
yspeed += _ud*_accel;
xspeed += _lr*_accel;

xspeed = clamp(xspeed-fric*sign(xspeed),-_maxspeed,_maxspeed);
yspeed = clamp(yspeed-fric*sign(yspeed),-_maxspeed,_maxspeed);

if (abs(xspeed) < 0.2) {
	xspeed = 0;
}
if (abs(yspeed) < 0.2) {
	yspeed = 0;
}

// floored speed values (for accurate collision checking)
var _fxspeed = floor(xspeed);
var _fyspeed = floor(yspeed);

var _tx = (x+_fxspeed);
var _ty = (y+_fyspeed);

if (scr_tilemap_box_collision(col_map,bbox_left + _fxspeed,bbox_top,bbox_right + _fxspeed,bbox_bottom)) {
	_tx = x;
}
if (scr_tilemap_box_collision(col_map,bbox_left,bbox_top + _fyspeed,bbox_right,bbox_bottom + _fyspeed)) {
	_ty = y;
}

#endregion

#region Shooting

if (mouse_check_button(mb_left) && !reloading) {
	if (ammo_loaded > 0  && (firetimer == 0) ) {
		ammo_loaded--;
		with (instance_create_layer(x,y,layer,obj_player_bullet)) {
			var _ang =  + random_range(-other.offset_ang,other.offset_ang);
			xspeed = lengthdir_x(spd,other.dir + _ang);
			yspeed = lengthdir_y(spd,other.dir + _ang);
		}
	}
	firetimer = (firetimer+1) mod firemax;
}

if ((ammo_loaded <= 0 || keyboard_check_pressed(ord("R")))) {
	var _diff = max_load - ammo_loaded;	
	var _pull = (_diff < ammo_left) ? _diff : ammo_left;
	ammo_left -= _pull;
	ammo_loaded += _pull;
	reloading = true;
	alarm[0] = game_get_speed(gamespeed_fps)/2;
}

#endregion

#region Animated bits

sprite_index = reloading ? spr_player_reload : spr_player;

#endregion

#region Finalise movement
if (hp > 0) {	// if you're not dead
	x = _tx;
	y = _ty;
} else {
	show_message("You died after senselessly killing " + string(obj_controller.killed_enemies) + " soldiers");
	game_restart();
}
#endregion