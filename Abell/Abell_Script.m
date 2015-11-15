% Abell driver script

clear all;
close all;
%Loading the data from F775W filter
load('HST_MOS_5136_ACS_WFC_F775W_drz.mat');
data1=imageData;
%Loading the data from F625W filter
load('HST_MOS_5136_ACS_WFC_F625W_drz.mat');
data2=imageData;
%Loading the data from F775W filter
load('HST_MOS_5136_ACS_WFC_F475W_drz.mat');
data3=imageData;
% Since data1,data2,data3 have same sizes.
[row,col,C]=size(data1);
%Setting -ve values of intensity to zero
for x = 1:col
for y = 1:row
if(data1(x,y) < 0)
data1(x,y)=0;
end
if(data2(x,y) < 0)
data2(x,y)=0;
end
if(data3(x,y) < 0)
data3(x,y)=0;
end
end
end
%Obtaining min & max values for each dimension.
max_1 = max(max(data1));
min_1 = min(min(data1));
max_2 = max(max(data2));
min_2 = min(min(data2));
max_3 = max(max(data3));
min_3 = min(min(data3));
%Converting Double format to 8-bit integers [0,...,255] for display.
data1 = (data1-min_1)*255./ max_1 -min_1;
data2 = (data2-min_2)*255 ./ max_2-min_2 ;
data3 = (data3-min_3)*255 ./ max_3-min_3 ;
%Passing Componets to cat function in the order R,G,B respectively .
I=(cat(3,data1,data2,data3));
% Plotting the images in a 3X1 matrix
%Plotting the un-modified RGB Image
subplot(3,1,1),imshow(I),xlabel('the un-modified RGB image');
%Plotting the enhanced image using hubbleEnhance( 'powK', inputImage, 0.13)
enhance_m='powk';K=0.13;
label_string=sprintf('hubbleEnhance(enhance_m=''%s'',K=%.2f)',enhance_m,K);
subplot(3,1,2),Itest=hubbleEnhance('powk',I,.13);
xlabel(label_string);
%Plotting the enhanced image using hubbleEnhance( 'asinhK', inputImage, 10000)
enhance_m='asinhk';K=10000;
label_string=sprintf('hubbleEnhance(enhance_m=''%s'',K=%.2f)',enhance_m,K);
subplot(3,1,3),Itest=hubbleEnhance('asinhk',I,10000);
xlabel(label_string);
