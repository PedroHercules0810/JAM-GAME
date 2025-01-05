/// @description Insert description here
// You can write your code in this editor

draw_set_font(fn_pontos)
draw_text(50,100,"Pontuação: " + string(global.pontos))

//contando o tempo decorrido
draw_text(50, 150, "Tempo sobrevivido: " + string(floor(tempo / 60)) + " segundos");


if(global.arma_spawn){
// Variáveis de controle
var _x_base = 50;         // Posição X inicial do texto
var _y_base = 200;        // Posição Y base para as letras
var _amplitude = 10;      // Amplitude do movimento
var _velocidade = 0.001;    // Velocidade da oscilação
var _espacamento = 16;    // Espaçamento entre letras

// Texto a ser desenhado
var _texto = "SINTO CHEIRO DE ARMA NOVA";

// Desenhar cada letra com movimento independente e cor arco-íris
for (var _i = 0; _i < string_length(_texto); _i++) {
    var _letra = string_char_at(_texto, _i + 1);  // Obtém a letra atual
    var _x_pos = _x_base + _i * _espacamento;     // Calcula a posição X da letra
    var _y_pos = _y_base + _amplitude * sin(current_time * _velocidade + _i * 0.5); // Oscilação baseada no índice
    
    // Gerar cor arco-íris com base no índice usando a nova função
    var _hue = (current_time * 0.1 + _i * 20) mod 360; // Hue cíclico no intervalo 0-360
    var _cor = hsv_to_rgb(_hue, 1, 1); // Saturação e brilho máximos

    // Definir cor e desenhar a letra
    draw_set_colour(_cor);
    draw_text(_x_pos, _y_pos, _letra);
}

// Resetar a cor para evitar impacto em outros desenhos
draw_set_colour(c_white);

}

//draw_set_color(c_white)
