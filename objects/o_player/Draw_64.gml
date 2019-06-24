/// @description Insert description here
// You can write your code in this editor

#region Game Room UI
if ( room == r_game ) {
    draw_set_font(f_stats);
    draw_set_halign(fa_left);

    // Bottom left
    if ( previous_score != score ) {
        power_text_color = previous_score > score ? c_red : c_green;
        alarm[4] = 6;
        previous_score = score;
    }

    draw_set_color(power_text_color);
    draw_text(10, hh-50, "Power: " + string(score));

    draw_set_color(c_white);

    // Bottom right
    draw_set_halign(fa_right);
    draw_text(ww-30, hh-50, "Portals: " + string(max_teleporters - current_teleporters));


    // Top Right
    total_game_timer_counter += delta_time

    if ( total_game_timer_counter >= 1000000 ) {
        total_game_timer_counter = total_game_timer_counter - 1000000;
        total_game_timer++;
    }

    draw_set_halign(fa_right);
    draw_set_color(c_white);
    var minutes = total_game_timer div 60;
    var seconds = total_game_timer mod 60;
    second_text = seconds < 10 ? "0" + string(seconds) : string(seconds)
    draw_text(ww-10, 10, string(minutes) + ":" + second_text);


    // Top Left
    if ( keyboard_check(ord("I")) ) {
        draw_set_halign(fa_left);
        draw_set_font(f_score_text);
        draw_text(10, 10, "Max Speed: " + string(max_speed));
        draw_text(10, 30, "Teleport Speed: " + string(teleport_speed));
        draw_text(10, 50, "Damage Bonus: " + string(damage_increase));

        if ( regen_per_second > 0 ) {
            draw_text(10, 70, "Regaen: " + string(regen_per_second));
        }

        if ( failed_attempts > 0 ) {
            draw_text(10, 90, "Failed Attempts: " + string(failed_attempts));
        }
    }
}
#endregion

#region Game Over Room UI
if ( room = r_game_over ) {
    
    #region Store Best Times
    ini_open("on_deaths_bed.ini");
    var best_time = ini_read_real("best_times", "best_time", -1);
    var best_time_failure_count = ini_read_real("best_times", "best_time_failure_count", -1);
    var best_perfect_time = ini_read_real("best_times", "best_perfect_time", -1);    
    
    if ( ( total_game_timer < best_time or best_time < 0 ) and failed_attempts != 0 ) {
        show_debug_message("Saving new best time");
        best_time = total_game_timer;
        best_time_failure_count = failed_attempts;
        new_best_time = true;
        ini_write_real("best_times", "best_time", best_time);
        ini_write_real("best_times", "best_time_failure_count", best_time_failure_count);
    }
    
    if ( failed_attempts == 0 and (total_game_timer < best_perfect_time  or best_perfect_time == -1)) {
        show_debug_message("Saving new best perfect time");
        best_perfect_time = total_game_timer;
        new_best_perfect_time = true;
        ini_write_real("best_times", "best_perfect_time", best_perfect_time);
    }
    
    ini_close();
    #endregion
    
    xx = 10;
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    draw_set_font(f_header)
    draw_text(xx, 10, "You've sent the demon back home.")
    draw_text(xx, 40, "You can now rest once again. Enjoy your vacation.")
    
    #region total_time_text
    var minutes = total_game_timer div 60;
    var seconds = total_game_timer mod 60;
    var seconds_text = seconds < 10 ? "0" + string(seconds) : string(seconds)
    var sec_text = seconds == 1 ? "second" : "seconds";
    var total_time_text = "Total Time: " + string(minutes) + " minutes and " + seconds_text + " " + sec_text;
    #endregion
    
    #region failed_attempts_text
    var failed_attempts_text = "Your Total Failed Attempts: " + string(failed_attempts);
    #endregion

    draw_set_font(f_credits);
    draw_text(xx, 100, total_time_text)
    draw_text(xx, 130, failed_attempts_text)
    
        
    #region final_score_text
    if ( new_best_time ) {
       var failure_text = best_time_failure_count == 1 ? "failure" : "failures"; 
       draw_text(xx, 240, "Congratulations, you've acheived a new best time with " + string(best_time_failure_count) + " " + failure_text);
    }
    
    if ( new_best_perfect_time ) {
       draw_text(xx, 340, "Congratulations, you've acheived a new PERFECT best time with NO FAILURES!");
    }
    #endregion
    
    
}
#endregion