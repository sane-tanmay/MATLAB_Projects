% The display_time function displays the time provided 
%
%

function y = display_timeSim(hr,mints,sec)

time =[hr mints sec]
k=1;
sec=time(3);
mint=time(2);
hr=time(1);
bg_cl=[1 1 1];

pause on;
hfig=figure('visible','off');
set(hfig,'NumberTitle','off');
set(hfig,'name','Analog Clock');
set(hfig,'color',bg_cl);
set(hfig,'visible','on');
axis off;

%Draw clock
clck_rad=4.9; % Clock radius
sec_hd_len= (0.85)*clck_rad;%second_hand length
cl_brdr=linspace(0,2*pi,1200); % number of points on the clock border
x_plr=clck_rad*cos(cl_brdr); %x polar co-ord
y_plr=clck_rad*sin(cl_brdr); %y ploar co-ord
hold on
plot(x_plr,y_plr,'k','linewidth',4); % outer rim

%plot numbers 
clc_xcr=0;
clc_ycr=0;

clck_num_r= clck_rad+0.5; %virtual radius of numbers
 %from 60deg i.e pos 1 to pos 12 in steps of  -ve 30 deg 
 for i=0:11
 clck_num_ang{i+1}= (pi/3)-((pi*i)/6);
 end 

clck_num_ang= cell2mat(clck_num_ang);
clck_num_ang=clck_num_ang';
clck_hr_num = linspace(1,12,12)'; %Numbers to be plotted
clck_num_ar = [clck_num_r*cos(clck_num_ang) clck_num_r*sin(clck_num_ang) clck_hr_num]; %row matrix of x y cd of mumbers
%Display text at these numbers
han_num_dis = text(clck_num_ar(:,1)+clc_xcr,clck_num_ar(:,2) + clc_ycr,num2str(clck_num_ar(:,3)),'horizontalAlignment','center','verticalAlignment','middle');

curr_sec=sec;
curr_min=mint;
curr_hr=hr;


 %declare sec hand graphics obj
sec_hd_len= (0.75)*clck_rad;%second_hand length
 sec_h_pos_deg=(-(curr_sec)/60)*(2*pi)+(pi/2); % seconds to degres, at zero secs the clock is at 12 o clock
 han_sec=plot([0 sec_hd_len*cos(sec_h_pos_deg)],[0 sec_hd_len*sin(sec_h_pos_deg)],...
    'color','r','linewidth',1.5);
 
 
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
  close gcf;
y=1;

end