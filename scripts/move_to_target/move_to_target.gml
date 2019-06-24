/// @param target
/// @param speed
/// @param should_rotate_image

var target = argument0;
var spd = argument1;
var should_rotate_image = argument2;

var attack_direction = point_direction(x,y, target.x, target.y);
direction = attack_direction;
speed = spd;
if ( should_rotate_image  == true ) {
    image_angle = attack_direction
}
