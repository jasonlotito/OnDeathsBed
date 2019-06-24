/// @description Decides on next attack type
// You can write your code in this editor
state = choose(
    boss_states.eye_stalk_attack,
    boss_states.main_eye_attack,
    boss_states.mouth_attack);

alarm[0] = random_range(
    min_seconds_between_attacks,
    max_seconds_between_attacks);