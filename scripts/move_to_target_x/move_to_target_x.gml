/// @param targets_x
/// @param speed
/// @param should_rotate_image

var xx = argument0;
var spd = argument1;
var should_rotate_image = argument2;

var attack_direction = point_direction(x,y, xx, y);

if ( point_distance(x, y, xx, y) < spd ) {
    speed = 0;
    exit;
}

direction = attack_direction;
speed = spd;
if ( should_rotate_image  == true ) {
    image_angle = attack_direction
}
