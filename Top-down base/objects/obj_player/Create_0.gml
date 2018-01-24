/// @description Initlialisation of the player object

cell_size = 64;
cell_power = 6;

xspeed = 0;
yspeed = 0;
fric = 0.5

dir = 0;

hp = 100;

col_layer = layer_get_id("collision");
col_map = layer_tilemap_get_id(col_layer);

max_load = 30;
ammo_loaded = max_load;
ammo_left = 300;

reloading = false;
firetimer = 0;
firemax = 4;
offset_ang = 0.5;


key_up = ord("W");
key_down = ord("S");
key_left = ord("A");
key_right = ord("D");

