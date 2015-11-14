
close all;
clear all;
Ic=imread('calvin.jpg');
label_string=sprintf('Original Image');
subplot(2,3,1),imshow(Ic),xlabel(label_string);
I2=jitter(Ic,5,5,0,0);
sigma_x=5;sigma_y=5;mu_x=0;mu_y=0;
label_string=sprintf('jitter(sigma_x=%d,sigma_y=%d,mu_x=%d,mu_y=%d)',sigma_x,sigma_y,mu_x,mu_y);
subplot(2,3,2),imshow(I2),xlabel(label_string);
I2=jitter(Ic,5,10,10,-10);
sigma_x=5;sigma_y=10;mu_x=10;mu_y=-10;
label_string=sprintf('jitter(sigma_x=%d,sigma_y=%d,mu_x=%d,mu_y=%d)',sigma_x,sigma_y,mu_x,mu_y);
subplot(2,3,3),imshow(I2),xlabel(label_string);
I2=jitter(Ic,5,5,0,0);
sigma_x=5;sigma_y=5;mu_x=0;mu_y=0;
label_string=sprintf('jitter(sigma_x=%d,sigma_y=%d,mu_x=%d,mu_y=%d)',sigma_x,sigma_y,mu_x,mu_y);
subplot(2,3,4),imshow(I2),xlabel(label_string);
Id=Ic;
for k=1:5
Id=jitter(Id,5,5,0,0);
end
sigma_x=5;sigma_y=5;mu_x=0;mu_y=0;
label_string=sprintf('jitter(sigma_x=%d,sigma_y=%d,mu_x=%d,mu_y=%d) \n Iterated 5 times',sigma_x,sigma_y,mu_x,mu_y);
subplot(2,3,5),imshow(Id),xlabel(label_string);
If=Ic;
for k=1:5
If=jitter(If,1,5,0,0);
end
sigma_x=1;sigma_y=5;mu_x=0;mu_y=0;
label_string=sprintf('jitter(sigma_x=%d,sigma_y=%d,mu_x=%d,mu_y=%d)\n Iterated 5 times',sigma_x,sigma_y,mu_x,mu_y);
subplot(2,3,6),imshow(If),xlabel(label_string);
