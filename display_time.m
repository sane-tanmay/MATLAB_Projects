% The display_time function displays the time provided 
%
%

function y = display_time(hr,mints,sec)

global curr_sec curr_hr curr_min is_on han_sec han_min han_hr;

 is_on=1;

 disp('Timer');

clck_rad=4.9;
time =[hr mints sec]
k=1;
sec=time(3);
mint=time(2);
hr=time(1);
bg_cl=[1 1 1];

curr_sec=sec;
curr_min=mint;
curr_hr=hr;
%declare sec hand graphics obj
sec_hd_len= (0.75)*clck_rad;%second_hand length
 sec_h_pos_deg=(-(curr_sec)/60)*(2*pi)+(pi/2); % seconds to degres, at zero secs the clock is at 12 o clock
 han_sec=plot([0 sec_hd_len*cos(sec_h_pos_deg)],[0 sec_hd_len*sin(sec_h_pos_deg)],...
    'color',bg_cl,'linewidth',1.5);
 
%declare min hand graphics obj
min_hd_len= (0.65)*clck_rad;%min_hand length
min_h_pos_deg=-(time(2)+time(3)/60)/60*2*pi+pi/2; % min to degres, at zero secs the clock is at 12 o clock
han_min=plot([0 min_hd_len*cos(min_h_pos_deg)],[0 min_hd_len*sin(min_h_pos_deg)],...
    'color',bg_cl,'linewidth',2);

%declare hr hand graphics obj
hr_hd_len= (0.55)*clck_rad;%hr_hand length
hr_h_pos_deg=-(time(1)+time(2)/60+time(3)/3600)/12*2*pi+pi/2; % hr to degres, at zero secs the clock is at 12 o clock
han_hr=plot([0 hr_hd_len*cos(hr_h_pos_deg)],[0 hr_hd_len*sin(hr_h_pos_deg)],...
    'color',bg_cl,'linewidth',3.5);
 
  
%Initil dispaly
ts=-(sec)/60*2*pi+pi/2;
set(han_sec,'XData',[0 sec_hd_len*cos(ts)],'YData',[0 sec_hd_len*sin(ts)], 'Color','red');
       
mins_c_pos=-( mint+ sec/60)/60*2*pi+pi/2; % min to degres, at zero secs the clock is at 12 o clock
set(han_min,'XData',[0 min_hd_len*cos(mins_c_pos)],'YData',[0 min_hd_len*sin(mins_c_pos)], 'Color','black');   

hr_c_pos=-( hr+mint/60+sec/3600)/12*2*pi+pi/2; % hr to degres, at zero secs the clock is at 12 o clock
set(han_hr,'XData',[0 hr_hd_len*cos( hr_c_pos)],'YData',[0 hr_hd_len*sin( hr_c_pos)], 'Color','black');   
  

% Timer Initialized
y1=start_timer();

y=1;

end