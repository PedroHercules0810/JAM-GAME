/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y, Obj_player)){
	if(Obj_player.vida >= 10){
		Obj_player.vida += 1;
	} else{
		global.pontos += 20;	
	}
	instance_destroy(id);
}