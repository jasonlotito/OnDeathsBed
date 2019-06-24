/// @description Insert description here
// You can write your code in this editor
instance_destroy()
show_particles()
score -= 10;
if ( ! audio_is_playing(Hit) ) {
    audio_play_sound(Hit, 4, false);
}