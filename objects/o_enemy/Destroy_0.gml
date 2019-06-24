/// @description Insert description here
// You can write your code in this editor
show_particles()

if ( current_health <= 0 ) {
    score += max_health * 10 * score_multiplier;   
}

if (instance_exists(spawner)) {
    spawner.current_spawns -= 1;
}