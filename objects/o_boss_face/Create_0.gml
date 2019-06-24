/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enum boss_states {
    pre_battle,
    idle,
    moving,
    eye_stalk_attack,
    eye_stalk_charging,
    main_eye_attack,
    main_eye_charging,
    mouth_attack,
    mouth_charging
}

enum boss_phase { 
    one,
    two,
    three
}

phase = boss_phase.one;
state = boss_states.pre_battle;
alarm[1] = 60;
announce_phase = true;
alarm[6] = 120;

ww = camera_get_view_width(view_camera[0]) 
hh = camera_get_view_height(view_camera[0])