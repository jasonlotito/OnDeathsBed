/// @description Insert description here
// You can write your code in this editor
var next_action = choose(
    spirit_actions.move_left,
    spirit_actions.move_right,
    spirit_actions.idle);
    
switch(next_action) {
    case spirit_actions.move_left:
        x_speed = -2;
    break;
    case spirit_actions.move_right:
        x_speed = 2;
    break;
    case spirit_actions.idle:
        x_speed = 0;
    break;
}

alarm[0] = choose(120,240,360);

