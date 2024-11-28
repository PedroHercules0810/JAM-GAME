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
direction = point_direction(x,y,mouse_x, mouse_y)
image_angle = direction;

//atirando
cooldown ++;
if(_mouse_click && cooldown >= espera){
	var _xx = x + lengthdir_x(64, image_angle);
	var _yy = y + lengthdir_y(64, image_angle);
	instance_create_layer(_xx, _yy, layer , obj_bala);
	cooldown = 0;
}

var _xx = x + lengthdir_x(64, image_angle);
var _yy = y + lengthdir_y(64, image_angle);

obj_arma.x = _xx;
obj_arma.y = _yy;

if(place_meeting(x,y, obj_cururu) && invencivel == false){
	vida -= 1;
	invencivel = true;
	alarm[0] = 120;
}

if(vida <= 0) {
	game_restart();
}