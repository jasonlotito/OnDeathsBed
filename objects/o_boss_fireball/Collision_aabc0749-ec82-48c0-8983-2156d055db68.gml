/// @description Insert description here
// You can write your code in this editor
instance_destroy()
score -= attack_strength;
show_particles();
if ( ! audio_is_playing(Hit) ) {
    audio_play_sound(Hit, 4, false);
}