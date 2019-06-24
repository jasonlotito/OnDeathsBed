/// @description Insert description here
// You can write your code in this editor
if ( room == r_menu ) {
    game_end()
} else {
    room_goto(r_menu);
    instance_destroy(o_player)
}