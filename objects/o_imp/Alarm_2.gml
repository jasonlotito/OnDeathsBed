/// @description Move while patrolling
// You can write your code in this editor
if ( state == imp_states.patrol_move ) {
    patrol_x(2);
    alarm[2] = choose(120,240,360);
}