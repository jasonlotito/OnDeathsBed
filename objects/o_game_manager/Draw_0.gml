/// @description Insert description here
// You can write your code in this editor
if ( room == r_credits ) {
    xx = 10;
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    draw_set_font(f_header)
    draw_text(xx, 10, "Credits - All Free from GM Marketplace")   
    
    draw_set_font(f_credits);
    draw_text(xx, 50, "Background Music")
    draw_text(xx, 72, "Myth and Legend Audio Assets")
    draw_text(xx, 94, "Black Light Sound")
    
    draw_text(xx, 138, "Sound FX")
    draw_text(xx, 170, "Hit Sound Effect")
    draw_text(xx, 192, "Enter Entertainment Assets")
    
    draw_text(xx, 224, "Audio Megapack - 160 sounds!")
    draw_text(xx, 246, "Joshua Wayne")
}

if ( room = r_scores ) {

    #region Get Best Times
    /// TODO: We open and read and close from the file every frame wtf
    ini_open("on_deaths_bed.ini");
    var best_time = ini_read_real("best_times", "best_time", -1);
    var best_time_failure_count = ini_read_real("best_times", "best_time_failure_count", -1);
    var best_perfect_time = ini_read_real("best_times", "best_perfect_time", -1);    
    ini_close();
    #endregion
    
    xx = 10;
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    draw_set_font(f_header)
    draw_text(xx, 10, "Best Times")
        
     
    #region final_score_text
   
    
    draw_set_font(f_credits);
    if ( best_time != -1 ) {
        var minutes = best_time div 60;
        var seconds = best_time mod 60;
        var second_text = seconds < 10 ? "0" + string(seconds) : string(seconds)
        
        var time_string = string(minutes) + ":" + second_text;
        
        var failure_text = best_time_failure_count == 1 ? "failure" : "failures"; 
        draw_text(xx, 240, "Your best time was " + time_string + " with " + string(best_time_failure_count) + " " + failure_text);
    } else {
        draw_text(xx, 240, "It doesn't seem like you've played the game.");   
        draw_text(xx, 280, "What did you expect to find here?");   
    }
    
    if ( best_perfect_time != -1 ) {
        var minutes = best_perfect_time div 60;
        var seconds = best_perfect_time mod 60;
        var second_text = seconds < 10 ? "0" + string(seconds) : string(seconds)
        
        var time_string = string(minutes) + ":" + second_text;
        draw_text(xx, 340, "You best time in a perfect run is " + time_string);
    } else {
        draw_text(xx, 340, "Sorry, you haven't completed a perfect run yet.");
    }
    #endregion
    
}