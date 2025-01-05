/// @description Insert description here
// You can write your code in this editor
// Coordenadas e tamanho do botão
var _btn_x = x;       // Posição X do botão
var _btn_y = y;       // Posição Y do botão
var _btn_width = sprite_width;  // Largura do botão
var _btn_height = sprite_height; // Altura do botão

// Verificar se o mouse está sobre o botão
if (mouse_x >= _btn_x && mouse_x <= _btn_x + _btn_width &&
    mouse_y >= _btn_y && mouse_y <= _btn_y + _btn_height) {
    // O mouse está sobre o botão
    image_alpha = 0.8; // Exemplo: Tornar o botão um pouco mais transparente
    if (mouse_check_button_pressed(mb_left)) {
        if(texto == "Bora jogar"){
			room_goto(rm_main)
		}
		if(texto == "Pontuação"){
			room_goto(rm_pontos)
		}
		if(texto == "Voltar"){
			room_goto(rm_menu)
		}
		if(texto == "Sair"){
			game_end()
		}
    }
} else {
    // O mouse não está sobre o botão
    image_alpha = 1; // Restaura a opacidade
}