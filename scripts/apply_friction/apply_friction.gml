var amount = argument0;

if ( x_speed != 0 ) {
    if ( abs(x_speed) - amount > 0 ) {
        x_speed -= amount * image_xscale;   
    } else {
        x_speed = 0;
    }
}