/// @description Insert description here
// You can write your code in this editor

speed = velocidade;
recarga += 1;

var _distance_player = point_distance(x,y,Obj_player.x, Obj_player.y);
var _direcao_player = point_direction(x,y, Obj_player.x, Obj_player.y)

//verificando as distancias do player
if(_distance_player <= 700){
	estado = "cacando"
} else {
	estado = "andando"
}
if(_distance_player <= 450){
	estado = "atirando"
}

//flipando quando olhar pra tras
if(_direcao_player >= 90 && _direcao_player <= 270){
	image_xscale = -2;
}else {
	image_xscale = 2;
}

if(direction >= 90 && direction <= 270){
		image_xscale = -1;
	}else {
		image_xscale = 1;
	}

//controlando os estados do besouro
switch(estado){
	case "cacando":

		direction = point_direction(x,y,Obj_player.x, Obj_player.y);
		velocidade = 3;

	break;
	
	case "andando":

		alarm[0] = 120;
		velocidade = 1.5

	break;
	
	case "atirando": 
		velocidade = 0;
		image_speed = 0;
		if(carregando == false && recarga >= 180){
			carregando = true
			alarm[1] = 1;
			recarga = 0
		}
	break;	
}


//tomando tiro
if(place_meeting(x,y,obj_bala)){
	vida -= obj_bala.dano;
}

//morrendo
if(vida <=0) instance_destroy(id);