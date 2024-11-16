/// @description Insert description here
// You can write your code in this editor
var _x = 16

var _frame = 1

_frame += 1;
repeat(vida){
draw_sprite_ext(spr_coracao,_frame, _x, 10, 4,4,0,c_white,1)
_x += sprite_get_width(spr_coracao)+50
}

draw_text(sprite_width, sprite_height -10, espera)