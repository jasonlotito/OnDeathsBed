/// @description Teleport Exit
// You can write your code in this editor
if ( instance_exists(last_teleporter) )
{
    show_particles()
    x = exit_teleport_x;
    y = exit_teleport_y;
    state = player.idle;
    show_particles();
}

alarm[2] = 60;