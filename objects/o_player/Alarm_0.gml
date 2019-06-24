/// @description Come out of attack
// You can write your code in this editor

if ( state == player.attacking ) {
    with(instance_create_layer(x, y, "Instances", o_scythe_wave)) {
        direction = other.attack_direction; //other.image_xscale > 0 ? 0 : 180;
        //image_xscale = other.image_xscale
        speed = 12;
        image_angle = other.attack_direction;
        damage += other.damage_increase;
    
    }
    state = player.idle;
}