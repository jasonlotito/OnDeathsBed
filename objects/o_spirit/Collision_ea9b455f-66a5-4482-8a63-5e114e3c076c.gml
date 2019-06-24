/// @description Insert description here
// You can write your code in this editor
score -= 10;
instance_destroy();
if ( ! audio_is_playing(Hit) ) {
    audio_play_sound(Hit, 4, false);
}