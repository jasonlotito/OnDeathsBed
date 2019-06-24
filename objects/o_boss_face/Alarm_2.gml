/// @description Eye stalk attack
// You can write your code in this editor
state = boss_states.idle

var eyesx = ds_list_create()
eyesx[0] = bbox_left + 25;
eyesx[1] = bbox_left + 54;
eyesx[2] = bbox_left + 80;
eyesx[3] = bbox_left + 109;

var eyesy = ds_list_create()
eyesy[0] = bbox_top + 23;
eyesy[1] = bbox_top + 12;
eyesy[2] = bbox_top + 13;
eyesy[3] = bbox_top + 26;

var i = 0;
repeat(4) {
    instance_create_layer(eyesx[i], eyesy[i], "Attacks", o_boss_fireball);
    i++;
}

var fire_count;

switch(phase) {
    case boss_phase.two:
        fire_count = 2;
        break;
    case boss_phase.three:
        fire_count = 4;
        break;
}

if ( phase == boss_phase.two or phase == boss_phase.three ) {
    eye_stalk_attack_counter++
    if ( eye_stalk_attack_counter <= fire_count ) { 
        alarm[2] = 10;
    } else {
        eye_stalk_attack_counter = 0;   
    }
}