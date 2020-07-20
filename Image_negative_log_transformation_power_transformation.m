clc
clear all
close all

%Negative image
a = imread('H:\3-2 Term\matlab_works\rose4.png');
b = rgb2gray(a);
c = 255-b;
figure;
subplot(1,2,1),imshow(a),title('Real Image');
subplot(1,2,2),imshow(c),title('Negative Image');
%Negative image finished

%Log Transformation of image
img = imread('H:\3-2 Term\matlab_works\rose2.jpg');
logimg = rgb2gray(img);
logresult = im2double(img);
result1 = 2*log(1+logresult);
result2 = 2.5*log(1+logresult);
result3 = 3*log(1+logresult);
figure;
subplot(2,2,1),imshow(img),title('Real image');
subplot(2,2,2),imshow(result1),title('Output Scaling Factor 2');
subplot(2,2,3),imshow(result2),title('Output Scaling Factor 2.5');
subplot(2,2,4),imshow(result3),title('Output Scaling Factor 3');
%Log Transformation finished


%Power Transformation of image
pimg = imread('H:\3-2 Term\matlab_works\weather.jpeg');
presult = rgb2gray(pimg);
power_result = im2double(pimg);
output1 = 2*(power_result.^0.5);
output2 = 2*(power_result.^1.5);
output3 = 2*(power_result.^3.0);
figure;
subplot(2,2,1),imshow(pimg),title('Real Image');
subplot(2,2,2),imshow(output1),title('Output Power Factor 0.5');
subplot(2,2,3),imshow(output2),title('Output Power Factor 1.5');
subplot(2,2,4),imshow(output3),title('Output Power Factor 3.0');
%Power Transformation finished



