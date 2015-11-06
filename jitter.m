% Function Syntax :[output_image]=jitter (input_image,sigma_x,sigma_y,mu_x,mu_y)
% Detailed Explanation : The function takes input parameters such as an input_image either color or grayscale image,Gaussian parameters
% sigma_x,sigma_y ,mu_x & mu_y .This function returns an output_image in which each of the image pixel's
% location has been transformed by introducing a random discplacement,
% dx = (1/(sigma_x*sqrt(2*pi)))*exp((1/(2*(sigma_x)^2))*(x-mu_x)^2) to x thus transforming its location
% to x+dx & y to y+dy (where dy = (1/(sigma_y*sqrt(2*pi)))*exp((1/(2*(sigma_y)^2))*(y-mu_y)^2 rescpetively .
% The displacements dy & dx follow Gaussian Distribution .
function[ Inew ] = jitter( I,sigma_x,sigma_y,mu_x,mu_y )
[row,col,C]=size(I);
Inew=uint8(ones(row,col));
zx = randn(row,col);
for C1=1:C
for x=1:col
for y=1:row
temp=I(y,x,C1);
dx = round(zx(y,x)*sigma_x + mu_x);
dy = round(zx(y,x)*sigma_y + mu_y);
x1 = (x + dx);
y1 = (y + dy);
if 1:x1:col
if 1:y1:row
Inew(y1,x1,C1)=temp;
end
end
end
end
end
end
