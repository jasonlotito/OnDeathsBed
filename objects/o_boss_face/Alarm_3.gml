/// @description Main Eye Attack
// You can write your code in this editor
state = boss_states.idle

var eyesx = ds_list_create()
eyesx[0] = bbox_left + 38;
eyesx[1] = bbox_left + 89;


var eyesy = ds_list_create()
eyesy[0] = bbox_top + 63;
eyesy[1] = bbox_top + 63;


var i = 0;
repeat(2) {
    instance_create_layer(eyesx[i], eyesy[i], "Attacks", o_boss_fireball);
    i++;
}

switch(phase) {
    case boss_phase.two:
        fire_count = 6;
        break;
    case boss_phase.three:
        fire_count = 9;
        break;
    default:
        fire_count = 3;
        break;
}

main_eye_attack_counter++
if ( main_eye_attack_counter <= fire_count ) { 
    alarm[3] = 10;
} else {
    main_eye_attack_counter = 0;   
}