/// @description Insert description here
// You can write your code in this editor

draw_set_font(fn_pontos)
draw_text(50,100,"Pontuação: " + string(global.pontos))

//contando o tempo decorrido
draw_text(50, 150, "Tempo sobrevivido: " + string(floor(tempo / 60)) + " segundos");