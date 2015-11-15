% Thus is a callback function used by the timer
% this function updates, the position of the hour, minute and second hand
% at each second's interval

function y=timer_loop(hObj, eventdata)

global curr_sec curr_hr curr_min is_on han_sec han_min han_hr debug1;

clck_rad=4.9;

bg_cl=[1 1 1];

sec_hd_len= (0.75)*clck_rad;%second_hand length
%declare sec hand graphics obj
sec_hd_len= (0.75)*clck_rad;%second_hand length
 sec_h_pos_deg=(-(curr_sec)/60)*(2*pi)+(pi/2); % seconds to degres, at zero secs the clock is at 12 o clock
 
%declare min hand graphics obj
min_hd_len= (0.65)*clck_rad;%min_hand length
min_h_pos_deg=-(curr_min+ curr_sec/60)/60*2*pi+pi/2; % min to degres, at zero secs the clock is at 12 o clock

%declare hr hand graphics obj
hr_hd_len= (0.55)*clck_rad;%hr_hand length
hr_h_pos_deg=-(curr_hr+ curr_min /60+ curr_sec/3600)/12*2*pi+pi/2; % hr to degres, at zero secs the clock is at 12 o clock
    
   if (is_on==1)
       
     if (debug1==1)
     disp('Inside');
     end
    curr_sec=curr_sec+1;
    if(curr_sec==60)
        curr_sec=0;
        curr_min=curr_min+1;
    end
    ts=-(curr_sec)/60*2*pi+pi/2;
    set(han_sec,'XData',[0 sec_hd_len*cos(ts)],'YData',[0 sec_hd_len*sin(ts)], 'Color','red');
       
    if(curr_min==60)
        curr_min=0;
        curr_hr=curr_hr+1;
    end
    mins_c_pos=-( curr_min+ (curr_sec/60))/60*2*pi+pi/2; % min to degres, at zero secs the clock is at 12 o clock %change
    set(han_min,'XData',[0 min_hd_len*cos(mins_c_pos)],'YData',[0 min_hd_len*sin(mins_c_pos)], 'Color','k');   

    if(curr_hr==12)
        curr_hr=0;
    end
    
   hr_c_pos=-( curr_hr+ curr_min/60+ curr_sec/3600)/12*2*pi+pi/2 ;% hr to degres, at zero secs the clock is at 12 o clock
   set(han_hr,'XData',[0 hr_hd_len*cos( hr_c_pos)],'YData',[0 hr_hd_len*sin( hr_c_pos)], 'Color','k');   
    
   drawnow;
   pause(0.08)% non neg no
   
   else 
   if (debug1==1)
   disp('Else');
   end
   end
     

end