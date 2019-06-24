/// @description Insert description here
// You can write your code in this editor

var ww = camera_get_view_width(view_camera[0]) 
var hh = camera_get_view_height(view_camera[0])
var can_buy = buff_cost < score;

if ( show_text ) {
    draw_set_font(f_score_text);
    draw_set_halign(fa_center);
    draw_text(ww/2, hh-250, "Name: " + string(buff_name));
    draw_text(ww/2, hh-235, "Description: " + string(buff_description));
    draw_text(ww/2, hh-220, "Soul Cost: " + string(buff_cost));
    
    if ( can_buy ) {
        draw_text(ww/2, hh-205, "Press [B] to Buy");
    }
    
    if ( keyboard_check_pressed(ord("B")) and can_buy ) {
        score -= buff_cost;
        event_user(0);
    }
}