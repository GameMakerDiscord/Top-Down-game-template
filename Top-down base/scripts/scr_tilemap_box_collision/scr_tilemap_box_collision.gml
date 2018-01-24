/// @desc scr_tilemap_box_collision
/// @arg tilemap
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

var _tilemap = argument[0],
	_x1 = argument[1],
	_y1 = argument[2],
	_x2 = argument[3],
	_y2 = argument[4];

var _p1 = tilemap_get_at_pixel(_tilemap,_x1,_y1),
	_p2 = tilemap_get_at_pixel(_tilemap,_x2,_y1),
	_p3 = tilemap_get_at_pixel(_tilemap,_x2,_y2),
	_p4 = tilemap_get_at_pixel(_tilemap,_x1,_y2);

return (_p1 || _p2 || _p3 || _p4);
