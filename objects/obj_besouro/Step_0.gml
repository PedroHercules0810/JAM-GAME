/// @description Insert description here
// You can write your code in this editor

recarga += 1;

var _direcao_player = point_direction(x,y,Obj_player.x, Obj_player.y);
var _distancia_player = point_distance(x,y,Obj_player.x, Obj_player.y);

x = clamp(x,0+sprite_width/2,room_width-sprite_width/2)
y = clamp(y, 0+sprite_height/2, room_height-sprite_height/2)



if place_meeting(x+vel_h,y,obj_parede) {
    while !place_meeting(x+sign(vel_h),y,obj_parede) {
        x += sign(vel_h);
	}
	vel_h = 0;
}
x += vel_h;

if place_meeting(x,y+vel_v,obj_parede) {
    while !place_meeting(x,y+sign(vel_v),obj_parede) {
        y += sign(vel_v);
    }
    vel_v = 0;
}
y += vel_v;

if (_distancia_player <= 700 && !carregando) {
   
        estado = "cacando";
    }
	else {
        estado = "alerta";
    }
	if(_distancia_player <= 450 && !carregando){
		estado = "atirando"
		
	}else if (_distancia_player <= 700 && !carregando){
        estado = "cacando";
    }else {
        estado = "alerta";
    }
	


// Ajusta a escala da imagem
if (_direcao_player >= 90 && _direcao_player <= 270) {
    image_xscale = -1;
} else {
    image_xscale = 1;
}

if (direction >= 90 && direction <= 270) {
    image_xscale = -1;
} else {
    image_xscale = 1;
}


if(_direcao_player >= 90 && _direcao_player <= 270){
	image_xscale = -1;
}else {
	image_xscale = 1;
}

if(direction >= 90 && direction <= 270){
		image_xscale = -1;
	}else {
		image_xscale = 1;
	}
	
	switch(estado){
		case "cacando":
			direction = _direcao_player;
			vel_h = velocidade * dcos(direction); // Movimento horizontal
			vel_v = velocidade * -dsin(direction); // Movimento vertical
		break;
		case "alerta":
			vel_v = velocidade * direcao_aleatoriax;
			vel_h = velocidade * direcao_aleatoriay;
		break;
		case "atirando":
			velocidade = 0;
		image_speed = 0;
		if(!carregando && recarga >= 180){
			carregando = true
			alarm[1] = 1;
			recarga = 0
		}
		break;
	}

alarm[0] = 220;

//tomando tiro
if(place_meeting(x,y,obj_bala)){
	vida -= obj_bala.dano;
}

//morrendo
if(vida <=0) instance_destroy(id);