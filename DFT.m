clc
clear all
close all
 
%if true
  % code
Img=imread('cameraman.tif');
%Img=mat2gray(Img);
[x,y]=size(Img);
subplot(1,2,1);
imshow(Img);
Img=double(Img);
A=zeros(x,y);
for i=1:x 
    for j=1:y 
        A(i,j)=exp((-1*1j*2*pi*j*i)/x);
    end
end
output=zeros(80,80);
Output=A*Img*A';
Output=fftshift(Output);
Output2 = zeros(x,y);
 for u = 1:x
    for v = 1:y
        Output2(u,v) = sqrt((real(Output(u,v))^2+imag(Output(u,v))^2));
    end
 end
 %Output2=fftshift(Output2);
 subplot(1,2,2);
 imshow(mat2gray(log10(1+Output2)))

 

