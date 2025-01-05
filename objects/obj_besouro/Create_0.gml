/// @description Insert description here
// You can write your code in this editor

recarga = 0; 

velocidade = 1.5

direcao_aleatoriax = choose(-1,1)
direcao_aleatoriay = choose(-1,1)

vel_v = 0;
vel_h = 0;

morreu = 0;

estado = "";

carregando = false;

vida = 5;

if(place_meeting(x,y, obj_parede)) instance_destroy(id,false)