//variaveis
var _up = max(keyboard_check(ord("W")), keyboard_check(vk_up))
var _down = max(keyboard_check(ord("S")), keyboard_check(vk_down))
var _left = max(keyboard_check(ord("A")), keyboard_check(vk_left))
var _right = max(keyboard_check(ord("D")), keyboard_check(vk_right))
var _mouse_click = mouse_check_button(mb_left)


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
	instance_create_layer(_xx, _yy, layer , obj_bala);
	cooldown = 0;
}

//fazendo a arma girar ao redor do player
var _xx = x + lengthdir_x(80, direction);
var _yy = y + lengthdir_y(80, direction);

obj_arma.x = _xx;
obj_arma.y = _yy;

//fazendo o player flipar qnd a arma estiver atras

if(_mouse_direcao >= 90 && _mouse_direcao <= 270){
	image_xscale = -1
	obj_arma.image_yscale = -2
} else {
	image_xscale = 1
	obj_arma.image_yscale = 2
}


//colidindo com o cururu
if(place_meeting(x,y, obj_cururu) && invencivel == false){
	vida -= 1;
	invencivel = true;
	alarm[0] = 120;
}

//morrendo
if(vida <= 0) {
	game_restart();
}