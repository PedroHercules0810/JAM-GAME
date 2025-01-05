//variaveis
var _up = max(keyboard_check(ord("W")), keyboard_check(vk_up))
var _down = max(keyboard_check(ord("S")), keyboard_check(vk_down))
var _left = max(keyboard_check(ord("A")), keyboard_check(vk_left))
var _right = max(keyboard_check(ord("D")), keyboard_check(vk_right))
var _mouse_click = mouse_check_button(mb_left)

//fazendo animação de andar
if(_up || _down || _left || _right){
	image_speed = 2;
}
else {
	image_speed = 0;
	image_index = 3;
}

//contando o tempo
tempo += 1;

//criando as armas
if(!instance_exists(obj_arma)){
	instance_create_layer(x,y, layer, obj_arma)
}

if(global.arma == "pistola"){
	obj_arma.image_index = 1;
} else if(global.arma == "escopeta"){
	obj_arma.image_index = 0;
}

//movimentação
vel_h = (_right - _left) * velocidade
vel_v = (_down - _up) * velocidade

//limitando o movimento
x = clamp(x, 0 + sprite_width/2, room_width-sprite_width/2)
y = clamp(y, 0 + sprite_height/2, room_height-sprite_height/2)
//colisao
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

//olhando para o mouse
var _mouse_direcao = point_direction(x,y,mouse_x, mouse_y)
direction = _mouse_direcao

//atirando
cooldown ++;
if(_mouse_click && cooldown >= espera){
	var _xx = x + lengthdir_x(64, direction);
	var _yy = y + lengthdir_y(64, direction);
	audio_play_sound(Sound4,3,0,0.2);
	if(global.tiro == "unico"){
		instance_create_layer(_xx, _yy, layer , obj_bala);
	} else if (global.tiro == "espalha"){
		var _tiro1 = instance_create_layer(_xx, _yy, layer, obj_bala);
		_tiro1.direction += 15;
		var _tiro2 = instance_create_layer(_xx, _yy, layer, obj_bala);
		_tiro2.direction += 0;
		var _tiro3 = instance_create_layer(_xx, _yy, layer, obj_bala);
		_tiro3.direction -= 15;
	}
	cooldown = 0;
}

//fazendo a arma girar ao redor do player
var _xx = x + lengthdir_x(80, direction);
var _yy = y + lengthdir_y(80, direction);

obj_arma.x = _xx;
obj_arma.y = _yy;

//fazendo o player flipar qnd a arma estiver atras

if(_mouse_direcao >= 90 && _mouse_direcao <= 270){
	image_xscale = -3
	obj_arma.image_yscale = -2
} else {
	image_xscale = 3
	obj_arma.image_yscale = 2
}


//colidindo com o cururu
if((place_meeting(x,y, obj_cururu) || place_meeting(x,y, obj_besouro) || place_meeting(x,y, obj_bola)) && invencivel == false){
	vida -= 1;
	invencivel = true;
	alarm[0] = 120;
	audio_play_sound(snd_tiro,10,0,0.5);
}

//morrendo
if(vida <= 0) {
	global.morto = true;
}