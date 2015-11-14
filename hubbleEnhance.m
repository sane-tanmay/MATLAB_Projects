% Function to Hubble enhance 

%[outputImage]=hubbleEnhance(enhance_m,inputImage,K)
% Example : [outputImage]=hubbleEnhance( 'powK', inputImage, 0.13)
%Enhance function will accept 3 arguments.
%enhance_m:The first argument, 'powK', is a string value which will indicate the types of enhancement to perform.
%For Task 1 the code will support two different values for this parameter: (1) 'powK', and (2) 'asinhK'.
%%inputImage:The second parameter will be a matrix having dimensions NxMx3.
% This matrix will contain the un-enhanced image data (N rows, M columns, and 3 components for R, G, and B).
% K: The third parameter will be a value, K, which specifies the behavior of the chosen enhancement.
% The 'powK' function uses the following input/output relation:
% Inew(x,y) = (imageData(x,y))^(K)
% where K denotes the value of the exponent (power).
% Te 'asinhK' function uses the following input/output relation:
% Inew(x,y) = asinh(imageData(x,y)*K)/asinh(K)
% where K denotes a normalizing constant for the asinh() function.
%
function outputImage=hubbleEnhance(enhance_m,inputImage,K)
string_1=enhance_m;
string_2='powk';
[row,col,C]=size(inputImage);
outputImage=zeros(row,col,C);
if(strcmp(string_1,string_2))
%Power Function
% K denotes the value of the exponent (power).
outputImage = inputImage.^K;
else
%asinhK Function
% K denotes a normalizing constant for the asinh() function.
outputImage = asinh(inputImage*K)./asinh(K);
end
imshow(outputImage);
end
