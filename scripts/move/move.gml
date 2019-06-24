/// @param collision_object
var collision_object = argument0;

if ( place_meeting(x + x_speed, y, collision_object) ) {
    while ( ! place_meeting( x + sign(x_speed), y, collision_object) ) {
        x += sign(x_speed);
    }
    
    x_speed = 0;
}

x += x_speed;
var swidth = (sprite_width/2);
if ( x + swidth > room_width ) {
    x = room_width - swidth
} else if ( x <= 0 ) {
    x = swidth;   
}

if ( place_meeting(x, y + y_speed, collision_object) ) {
    while ( ! place_meeting( x, y + sign(y_speed), collision_object) ) {
        y += sign(y_speed);
    }
    
    y_speed = 0;
}

y += y_speed;


