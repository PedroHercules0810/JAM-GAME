/// @description Insert description here
// You can write your code in this editor

timer += 1;
if(global.pontos > max_pontos){
	max_pontos = global.pontos
}

if(room == rm_main){
	tempo += 1;
	if(!paredes){
		alarm[0] = true;
	}
}

if(room == rm_main){
	if(global.morto){
	room_restart()
	room_goto(rm_menu)
	tempo = 0;
	global.pontos = 0;
	}
}

if(instance_number(obj_cuscuz) <= 5 && room ==  rm_main){
	if(timer >= 180){
		instance_create_layer(random(room_width), random(room_height), layer, obj_cuscuz)
		timer = 0;
	}
}

if(timer>=  60 && room == rm_menu){
	show_debug_message("to aq")
	instance_create_layer(irandom_range(room_width, room_width + 60), random(room_height), "Instances", obj_cactu)
	timer = 0
}