/// @description Insert description here
// You can write your code in this editor
timer += 1;
if(!instance_exists(obj_powerup_arma) && timer >= 360 && global.arma != "escopeta"){
	instance_create_layer(irandom_range(0, room_width),irandom_range(0, room_height), layer, obj_powerup_arma);
	timer = 0;
}