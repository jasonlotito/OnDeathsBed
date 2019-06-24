///@param speed
var spd = argument0;

var next_action = choose(
    spirit_actions.move_left,
    spirit_actions.move_right,
    spirit_actions.idle);
    
switch(next_action) {
    case spirit_actions.move_left:
        x_speed = -spd;
    break;
    case spirit_actions.move_right:
        x_speed = spd;
    break;
    case spirit_actions.idle:
        x_speed = 0;
    break;
}