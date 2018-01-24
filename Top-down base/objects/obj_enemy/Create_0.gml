/// @description Initialisation
path = path_add();
step = 0;
spd = 2;
image_speed = 0;
if (!path_exists(path)) {
	show_message("Something has gone *very* wrong. ");	
}
max_step = 8;
step_offset = irandom(max_step-1);

hp = 20;
shot_counter = 4;
rounds = 3;