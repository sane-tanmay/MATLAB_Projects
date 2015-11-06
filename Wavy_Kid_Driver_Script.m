% This project illustrates the spatial image transformation aspect of image processing.
% Wave/ Sinusoidal transformation on image
%Driver Script

%Open given image
Ic=imread('calvin.jpg');
%Convert the image to grayscale
Ib=rgb2gray(Ic);
%Show the original grayscale image
subplot(2,3,1),imshow(Ib),xlabel('input image');
%Results of wave on grayscale, vert = 0
Inew=wave(Ib,20,2,0);
A=20;c=2;vert=0;
label_string=sprintf('wave(A=%d,c=%.2f,vert=%d)',A,c,vert);
subplot(2,3,2),imshow(Inew),xlabel(label_string);
%Results of wave on grayscale, vert = 1
Inew=wave(Ib,20,3,1);
A=20;c=2;vert=1;
label_string=sprintf('wave(A=%d,c=%.2f,vert=%d)',A,c,vert);
subplot(2,3,3),imshow(Inew),xlabel(label_string);
%Show the original color image
subplot(2,3,4),imshow(Ic),xlabel('input image');
%Results of wave on color image, vert = 0
Inew=wave(Ic,20,2,0);
A=20;c=2;vert=0;
label_string=sprintf('wave(A=%d,c=%.2f,vert=%d)',A,c,vert);
subplot(2,3,5),imshow(Inew),xlabel(label_string);
%Results of wave on color image, vert = 1
Inew=wave(Ic,20,3,1);
A=20;c=2;vert=1;
label_string=sprintf('wave(A=%d,c=%.2f,vert=%d)',A,c,vert);
subplot(2,3,6),imshow(Inew),xlabel(label_string);
ECGR 5103 HW 2 Sane Tanmay
