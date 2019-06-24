/// @description Respawn portal
// You can write your code in this editor
show_debug_message("Creating new spawner portal");
portal = instance_create_layer(x,y, "Portals", o_spawner_portal);
portal.score_drain = score_drain
respawning_portal = false;