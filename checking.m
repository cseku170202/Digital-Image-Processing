clc
clear all
close all

a = imread('H:\3-2 Term\matlab_works\rose3.jpg');
b = rgb2gray(a);
c = imhist(b);
d = numel(b);
e = c/d;
cdf1 = cumsum(e);

%a1 = imread('H:\3-2 Term\matlab_works\man.png');
a1 = imread('cameraman.tif');
%a1 = rand(256,256);
%b1 = rgb2gray(a1);
c1 = imhist(a1);
d1 = numel(a1);
e1 = c1/d1;
cdf2 = cumsum(e1);

Result = zeros(256,1,'uint8'); 


for r=1:256  
    [h,intencity] = min(abs(cdf1(r)-cdf2));
    Result(r) = intencity-1;    
end

output = Result(double(b)+1);

figure;
set(gcf, 'Position', get(0, 'ScreenSize'));
subplot(231),imshow(b),title('Real Image');
subplot(232),imshow(a1),title('Reference Image');
subplot(233),imshow(output),title('Final Image');
subplot(234),imhist(b),title('Histogram :Real Image');
subplot(235),imhist(a1),title('Histogram :Reference Image');
subplot(236),imhist(output),title('Histogram :Final Image');



