/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_musica1,0,1,0.1)
global.pontos = 0;
tempo = 0;
timer = 0;
paredes = false

function hsv_to_rgb(_hue, _sat, _val) {
    var _h = _hue / 60;
    var _c = _val * _sat;
    var _x = _c * (1 - abs((_h mod 2) - 1));
    var _m = _val - _c;

    var _r, _g, _b;
    if (_h < 1)      { _r = _c; _g = _x; _b = 0; }
    else if (_h < 2) { _r = _x; _g = _c; _b = 0; }
    else if (_h < 3) { _r = 0; _g = _c; _b = _x; }
    else if (_h < 4) { _r = 0; _g = _x; _b = _c; }
    else if (_h < 5) { _r = _x; _g = 0; _b = _c; }
    else            { _r = _c; _g = 0; _b = _x; }

    return make_colour_rgb((_r + _m) * 255, (_g + _m) * 255, (_b + _m) * 255);
}