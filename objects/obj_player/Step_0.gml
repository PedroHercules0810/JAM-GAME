/// @description Insert description here
// You can write your code in this editor

var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))

show_debug_message(x,y)

x = clamp(x,0+sprite_width/2,room_width-sprite_width/2)
y = clamp(y, 0+sprite_width/2, room_height-sprite_width/2)

y += (_down - _up) * velocidade
x += (_right - _left) * velocidade