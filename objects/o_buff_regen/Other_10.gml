/// @description Insert description here
// You can write your code in this editor
if ( o_player.regen_per_second < max_regen ) {
    o_player.regen_per_second += 2;
    o_player.regen_per_second = clamp(o_player.regen_per_second, 0, max_regen);
}