/// @description Regen
// You can write your code in this editor
current_health += 4;
current_health = clamp(current_health, 4, 100);
alarm[5] = phase == boss_phase.two ? 60 : 45;