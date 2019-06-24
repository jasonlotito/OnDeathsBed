/// @description Insert description here
// You can write your code in this editor
enum player {
    idle,
    moving,
    attacking,
    teleporting,
    falling
}
randomize();
state = player.idle;

display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

score = starting_score;
previous_score = score;
power_text_color = c_white;

alarm[3] = 60

audio_play_sound(ahh_bleep, 5, false);

ww = camera_get_view_width(view_camera[0]) 
hh = camera_get_view_height(view_camera[0])