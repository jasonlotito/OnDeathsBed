/// @description Start recharging teleporters
// You can write your code in this editor

o_player.current_teleporters -= 1;

if ( current_teleporters > 0 ) {
    alarm[2] = 30;   
}