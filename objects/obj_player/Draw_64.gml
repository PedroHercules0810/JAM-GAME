var _x = 16; // Posição inicial no eixo X
var _y = 10; // Posição no eixo Y



// Calcula o índice atual do frame para todos os corações
var _frame = floor(image_index);

// Desenha um coração para cada ponto de vida
repeat (vida) {
    draw_sprite_ext(spr_coracao, _frame, _x, _y, 4, 4, 0, c_white, 1);
    _x += sprite_get_width(spr_coracao) * 4 + 50; // Ajusta a posição para o próximo coração
}





