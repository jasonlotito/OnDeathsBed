/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);

var boss_font_color = c_white;

if ( current_health < 34 ) {
    boss_font_color = c_red;
} else if ( current_health < 67 ) {
    boss_font_color = c_orange;    
}

draw_set_color(boss_font_color);
draw_text(ww/2, 10, "Boss Health: " + string(current_health) + "%");

if ( announce_phase ) {
    var phase_text = "";
    switch(phase) {
        case boss_phase.one:
            phase_text = "Good Luck!"
        break;
        case boss_phase.two:
            phase_text = "You have entered the second phase..."
        break;
        case boss_phase.three:
            phase_text = "You have entered the final phase..."
        break;
    }
    draw_text(ww/2, 50, phase_text);
}

draw_set_halign(fa_left);
draw_set_color(c_white);