/// @description Insert description here
// You can write your code in this editor

time_since_last_spawn += delta_time;

if ( ! instance_exists(portal) and ! respawning_portal ) {
    show_debug_message("Respawning the portal");
    alarm[0] = 60 * random_range(min_seconds_to_respawn_portal, max_seconds_to_respawn_portal);
    respawning_portal = true;
    portal = noone;
}


if ( min_to_spawn > max_to_spawn ) {
    max_to_spawn = min_to_spawn;   
}

if ( current_spawns >= max_spawns or respawning_portal ) {
    exit;   
}

if ( time_since_last_spawn > (seconds_between_spawns*1000000) ) {
    if ( random_range(0,100) < chance_to_spawn ) {
        time_since_last_spawn = 0;
        repeat(random_range(min_to_spawn,max_to_spawn)) {
            with(instance_create_layer(x, y, "Instances", object_to_spawn)) {
                spawner = other;   
            }
            
            current_spawns += 1;
            
            if ( current_spawns >= max_spawns ) {
                exit;   
            }
        }
    }
}