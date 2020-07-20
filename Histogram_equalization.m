clc
clear all
close all

a = imread('H:\3-2 Term\matlab_works\rose4.png');
ah = histeq(a);

subplot(2,2,1),imshow(a),title('Real image');
subplot(2,2,2),imhist(a),title('Histogram of real image');
subplot(2,2,3),imshow(ah),title('Histogram Equalized image');
subplot(2,2,4),imhist(ah),title('Histogram of equalized image');