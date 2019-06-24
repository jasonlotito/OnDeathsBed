/// @description Mouth Attack
// You can write your code in this editor
state = boss_states.idle

var xx = bbox_left + 65;
var yy = bbox_top + 102;

repeat(1) {
    var imp = instance_create_layer(xx, yy, "Attacks", o_imp);
    imp.blow_up = true;
}

switch(phase) {
    case boss_phase.two:
        fire_count = 2;
        spawn_speed = 45;
        break;
    case boss_phase.three:
        fire_count = 3;
        spawn_speed = 30;
        break;
    default:
        spawn_speed = 60;
        fire_count = 1;
        break;
}

mouth_attack_counter++
if ( mouth_attack_counter <= fire_count ) { 
    alarm[4] = spawn_speed;
} else {
    mouth_attack_counter = 0;   
}