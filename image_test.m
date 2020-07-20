clc
clear all
close all
a = imread('H:\3-2 Term\matlab_works\rose.jpeg');
b = imread('H:\3-2 Term\matlab_works\flower1.jpg');
c = imadd(a,b);

d = imsubtract(a,b);

img = rgb2gray(a);
img1 = a;

subplot(2,2,1),imshow(a),title('Rose')
subplot(2,2,2),imshow(c),title('After Adding')
subplot(2,2,3),imshow(img),title('In gray')
subplot(2,2,4),imshow(img1),title('In rgb')

figure;imshow(d),title('After subtarcting')

