clc
clear all
close all

a = 100*rand(256,256);
figure;
subplot(2,2,1),imshow(a);
subplot(2,2,2),imhist(a);      