/// @description Insert description here
// You can write your code in this editor

if ( room != r_game and room != r_game_over ) {
    instance_destroy();   
}

var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var attack = mouse_check_button(mb_left);
var attack_x = mouse_x;
var attack_y = mouse_y;

var debug_god_mode = keyboard_check(vk_return);
var debug_go_to_game_over_screen = keyboard_check(vk_end);

if ( debug_god_mode ) {
    regen_per_second = 1000
    teleport_speed = 1
    damage_increase = 10
    max_speed = 6;
    max_teleporters = 100;
}

if ( debug_go_to_game_over_screen ) {
    failed_attempts = round(random_range(0,5));
    total_game_timer = round(random_range(60*10,60*30))
    room_goto(r_game_over);   
}

var teleport = mouse_check_button_pressed(mb_right);

var solid_o = o_collider;

#region Check Souls
if ( score <= 0 ) {
    score = 250;
    
    room_restart();
    x = o_player_spawn.x;
    y = o_player_spawn.y;
    failed_attempts++;
    audio_play_sound(exotic_diminish, 5, false);
}
#endregion

#region Check if we lose last teleporter ring
if ( state == player.teleporting && ! instance_exists(last_teleporter) ) {
    state = player.idle;
}
#endregion

#region Teleport

// We need to check if the player is teleporting into solid ground
if ( teleport and state != player.falling and current_teleporters < max_teleporters ) {
    if ( place_meeting(mouse_x, mouse_y, solid_o) ) {
        with(instance_create_layer(mouse_x, mouse_y, "Instances", o_teleport_exit)) {
            failure = true;   
        }
    } else {
        x_speed = 0;
        last_teleporter = instance_create_layer(mouse_x, mouse_y, "Instances", o_teleport_exit);
        exit_teleport_x = mouse_x;
        exit_teleport_y = mouse_y;
        state = player.teleporting;
        alarm[1] = teleport_speed;
        //if ( audio_is_playing(exotic_start) ) {
        //    audio_stop_sound(exotic_start);   
        //}
        //audio_play_sound(exotic_start, 5, false);
    }
}

#endregion

#region Perform Attack
if ( state == player.teleporting and attack ) {
    state = player.idle;   
    last_teleporter = noone;
}

if ( attack && state != player.attacking and state != player.teleporting ) {
    sprite_index = s_death_attacking;
    state = player.attacking;
    attack_direction = point_direction(x, y, mouse_x, mouse_y);
    alarm[0] = 18
}
#endregion

#region Check falling


// Let's check if the player is standing or should be falling
if ( ! place_meeting(x, y + 1, solid_o) ) {
    state = player.falling;
    y_speed += gravity_accel
} else {
    if ( state == player.falling ) {
        state = player.idle;    
    }
    
    y_speed = 0;   
}

#endregion

#region Handle walking
if ( state != player.teleporting and state != player.falling ) {
    // He is walking
    if ( x_speed != 0 ) {
        if ( state != player.attacking ) {
            state = player.moving
        }
        image_xscale = sign(x_speed);
    } else {
        if ( state != player.attacking ) {
            state = player.idle;       
        }
    }

    if ( left or right ) {
        x_speed += (right - left) * acceleration;
        x_speed = clamp(x_speed, -max_speed, max_speed);
    } else {
        apply_friction(acceleration);    
    }
}
#endregion

#region Set Sprite based on State
switch(state) {
    case player.attacking:
        sprite_index = s_death_attacking;
    break;
    case player.moving:
        sprite_index = s_death_walking;
    break;
    case player.idle:
        sprite_index = s_death_standing;
    break;
    case player.teleporting:
        sprite_index = s_death_teleporting;
    break;
    case player.falling:
        sprite_index = s_death_falling;
    break;
    default:
        sprite_index = s_death_standing;
    break;
}
#endregion

move(solid_o);