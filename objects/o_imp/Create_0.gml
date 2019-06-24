/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

target = instance_find(o_player, 0)

enum imp_states {
    tracking,
    attacking,
    throwing,
    recovery,
    patrol,
    patrol_move
}

state = imp_states.tracking