/// @description Insert description here
// You can write your code in this editor

paredes = true
repeat(20){
	var _xx  = random(room_width)
	var _yy = random(room_height)
	
	instance_create_layer(_xx,_yy, layer, obj_parede);
}