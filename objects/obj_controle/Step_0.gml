/// @description Insert description here
// You can write your code in this editor
tempo += 1;

if(global.pontos > max_pontos){
	max_pontos = global.pontos
}

if(room == rm_main && !paredes){
	alarm[0] = true;
}

if(global.morto && room == rm_main){
	room_restart()
	room_goto(rm_menu)
	tempo = 0;
}
