/// @description Insert description here
// You can write your code in this editor
ping_pong_animation(7)

if ( o_player.teleport_speed <= min_teleport_speed ) {
    instance_destroy()
    show_particles();
}