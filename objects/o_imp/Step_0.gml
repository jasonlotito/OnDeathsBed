/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var distance = distance_to_object(target)

if ( blow_up and ! blowing_up ) {
    alarm[3] = 600;
    blowing_up = true;
}

if ( distance <= vision_range ) {
    if ( distance < attack_range and state == imp_states.attacking ) {
        state = imp_states.attacking;
    
    } else if (distance < stopping_range and 
                state != imp_states.throwing and 
                state != imp_states.recovery ) {
        state = imp_states.attacking;
    } else if ( state != imp_states.throwing && state != imp_states.recovery ) {
        state = imp_states.tracking;
    }
} else {
    if ( state != imp_states.patrol_move ) {
        state = imp_states.patrol   
    }
}



switch(state) {
    case imp_states.tracking:
        sprite_index = s_imp_flying;
        if ( distance <= vision_range ) {
            move_to_target(target, 2, false);
        }
        
    break;
    case imp_states.attacking:
        sprite_index = s_imp_attacking;
        speed = 0;
        alarm[0] = 28;
        state = imp_states.throwing;
    break;
    case imp_states.throwing:
        sprite_index = s_imp_attacking;
        speed = 0;
    break;
    case imp_states.recovery:
        sprite_index = s_imp_flying;
    break;
    case imp_states.patrol:
        sprite_index = s_imp_flying;
        alarm[2] = 1;
        state = imp_states.patrol_move;
    break;
    case imp_states.patrol_move:
        sprite_index = s_imp_flying;
        move(noone);
    break;
}