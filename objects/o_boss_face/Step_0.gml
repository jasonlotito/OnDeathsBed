/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if ( current_health <= 0 ) {
    room_goto(r_game_over);   
}

if ( current_health < 67 and phase == boss_phase.one ) {
    phase = boss_phase.two;  
    alarm[5] = 60;
    announce_phase = true;
    alarm[6] = 120;
    min_seconds_between_attacks = 180;
    max_seconds_between_attacks = 360;
}

if ( current_health < 33 and phase == boss_phase.two ) {
    phase = boss_phase.three;   
    announce_phase = true;
    alarm[6] = 120;
}


if ( state == boss_states.pre_battle and distance_to_object(o_player) < 300  ) {
    state = boss_states.idle;
    alarm[0] = 1;
}

switch(state) {
    case boss_states.eye_stalk_charging:
        sprite_index = s_boss_charging_eye_stalks;
        //move_to_target_x(targets_x, 2, false);
        speed = 0;
        break;
    case boss_states.mouth_charging:
        sprite_index = s_boss_breath_weapon_attack;
        move_to_target_x(targets_x, 2, false);
        break;
    case boss_states.main_eye_charging:
        sprite_index = s_boss_charging_main_eyes;
        move_to_target_x(targets_x, 2, false);
        break;
    case boss_states.eye_stalk_attack:
        sprite_index = s_boss_charging_eye_stalks;
        state = boss_states.eye_stalk_charging;
        alarm[2] = 120;
        break;
    case boss_states.main_eye_attack:
        sprite_index = s_boss_charging_main_eyes;
        state = boss_states.main_eye_charging;
        alarm[3] = 120;
        break;
    case boss_states.mouth_attack:
        sprite_index = s_boss_breath_weapon_attack;
        state = boss_states.mouth_charging;
        alarm[4] = 60;
        break;
    default:
        sprite_index = s_boss_idle;
        move_to_target_x(targets_x, 2, false);
}