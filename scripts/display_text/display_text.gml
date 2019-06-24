/// @param text

var text = argument0;
draw_set_font(f_score_text);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

var len = string_length(text);
show_debug_message(len);


var c = c_black;
var text_box_padding = 10;
var text_box_top = 60;
var text_box_width = camera_get_view_width(view_camera[0]) - (text_box_padding*2)
draw_set_alpha(.5)
draw_rectangle_color(
    text_box_padding, camera_get_view_height(view_camera[0]) - text_box_top, 
    camera_get_view_width(view_camera[0]) - text_box_padding, 
    camera_get_view_height(view_camera[0]) - text_box_padding, 
    c, c, c, c, false);
draw_set_alpha(1)

draw_text_ext(
    text_box_padding * 2,
    camera_get_view_height(view_camera[0]) - (text_box_top-20), text, 20, text_box_width - (text_box_padding*2));


draw_set_halign(fa_left)