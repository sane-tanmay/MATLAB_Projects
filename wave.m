% Function Syntax :[output_image]= wave(input_image,A,c,vert)
% Detailed Explanation : The function takes input parameters such as an input_image either color or grayscale image,
% A the sin wave amplitude, and c the number of cycles for the sine wave over the entire length of the image, i.e.,
% c = 2 cycles/(image_height),a parameter vert , which if equal to zero the wave orientation is horizontal, otherwise the wave orientation is vertical.
% the function returns an output_image in which each of the image pixel's
% location has been transformed by introducing a displacement in x , dx
% ,where dx=Asin(c?(y?1)) & a displacement dy in y where dy=Asin(c?(x?1)).
% Thus the location of pixel vaue at (x,y) is transfromed to (x+dx,y+dy)
function[inew]= wave(I,A,c,vert)
%Rows and columns of input image matrix
[row,col,C]=size(I);
%Create a new image matrix
inew=uint8(zeros(row,col));
%check the value of image components
for C1=1:C
for x=1:col
for y=1:row
temp=I(y,x,C1);
%Check for condition of vertical
if vert==0
x1=x;
c=2/col;
dy=A*sin(2*c*pi*(x-1));
y1=round(y+dy);
else
y1=y;
c1=c/row;
dx=A*sin(2*c1*pi*(y-1));
x1=round(x+dx);
end
if 1:x1:col
if 1:y1:row
inew(y1,x1,C1)=temp;
end
end
end
end
end
end
