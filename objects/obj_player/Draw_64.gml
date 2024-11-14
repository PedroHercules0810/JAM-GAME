/// @description Insert description here
// You can write your code in this editor
var _x = 16

repeat(vida){
draw_sprite(spr_coracao,0, _x, 10)
_x += sprite_get_width(spr_coracao)+4
}

draw_text(sprite_width, sprite_height -10, espera)