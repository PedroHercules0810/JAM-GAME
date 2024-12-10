/// @description Insert description here
// You can write your code in this editor

var _direcao_player = point_direction(x,y,Obj_player.x, Obj_player.y);
var _distancia_player = point_distance(x,y,Obj_player.x, Obj_player.y);

speed = 0;

x = clamp(x,0+sprite_width/2,room_width-sprite_width/2)
y = clamp(y, 0+sprite_height/2, room_height-sprite_height/2)



if(_distancia_player <= 600){
	direction = _direcao_player
	speed = velocidade_cacada
	estado = "cacada"

} else{
	estado = "alerta"
	speed = velocidade

}

if(_direcao_player >= 90 && _direcao_player <= 270){
	image_xscale = -2;
}else {
	image_xscale = 2;
}

if(direction >= 90 && direction <= 270){
		image_xscale = -2;
	}else {
		image_xscale = 2;
	}

if(place_meeting(x,y, obj_bala)){
	vida -= obj_bala.dano	
}



if(vida <= 0 )
{
	instance_destroy(id)
}