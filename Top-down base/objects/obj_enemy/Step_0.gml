/// @description Calculate path + move along it
var _grid = obj_controller.grid;

//step = (step+1) mod max_step;

step += 1;
step = step mod max_step;

if (step == step_offset) {		// re-calculate once every four steps
	if (mp_grid_path(_grid,path,x,y,obj_player.x,obj_player.y,false)) {
		path_start(path,spd,path_action_stop,true);
	}
}

var _ang = direction

if (point_distance(x,y,obj_player.x,obj_player.y) < 128) {	//if in range
    _ang = point_direction(x,y,obj_player.x,obj_player.y);
	shot_counter--;
	if (shot_counter <= 0) {
		shot_counter = 4;
		if (rounds <= 0) {
			rounds = 3;
			shot_counter = 30;
		}
		var _bx = x, _by = y;
		var _los = false
		repeat (1000) {
			_bx += lengthdir_x(_ang,4);
			_by += lengthdir_y(_ang,4);
			if (tilemap_get_at_pixel(obj_controller.col_map,_bx,_by)) {
				break;
			}
			if (position_meeting(_bx,_by,obj_player)) {
				_los = true;
				break
			}
		}
		_los  = true;
		if (_los)		//if there is line of sight to the player
		{
			with ( instance_create_layer(x,y,layer,obj_enemy_bullet) ) {
				xspeed = lengthdir_x(spd,_ang);
				yspeed = lengthdir_y(spd,_ang);
			}
		}
	}
}
image_angle = _ang;

if (hp <= 0) {
	instance_destroy();
}