/// @description Quick initialisation
//camera = camera_create_view(0,0,width,height,0,noone,0,0,0,0);
var _cell_width = room_width >> cell_power;		// bitshift by the power gives
var _cell_height = room_height >> cell_power;	// the nearest power of 2

col_layer = layer_get_id("collision");
col_map = layer_tilemap_get_id(col_layer);

grid = mp_grid_create(0,0,_cell_width,_cell_height,64,64);
for (var _i=0;_i<_cell_width;_i++) {
	for (var _j=0;_j<_cell_height;_j++) {
		if (tilemap_get(col_map,_i,_j) >= 67) {
			mp_grid_add_cell(grid,_i,_j);
		}
	}
}
