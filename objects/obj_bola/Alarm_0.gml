/// @description Insert description here
// You can write your code in this editor

if(obj_besouro.id.morreu == 1){
		carregado = true;
	}

if(image_xscale < 2.5){
	image_xscale += .01;
	image_yscale += .01;
	alarm[0] = 1
	
} else {
	carregado = true;
	speed = 5;
	direction = point_direction( x,y, Obj_player.x, Obj_player.y)
}