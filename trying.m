clc
clear all
close all

%Input Image
B=imread('H:\3-2 Term\matlab_works\rose4.png');
A=rgb2gray(B);
imshow(A);title('Original Image');

%Preallocate the matrices with zeros
I1=A;
I=zeros(size(A));
I2=zeros(size(A));

%Filter Masks
F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];

%Padarray with zeros
A=padarray(A,[1,1]);
A=double(A);

%Implementation of the equation in Fig.D
for i=1:size(A,1)-2
    for j=1:size(A,2)-2
        
        P=A(i:i+2,j:j+2);
        q=F1.*A(i:i+2,j:j+2);
        y=sum( F1.*A(i:i+2,j:j+2) );
        o=sum(sum( F1.*A(i:i+2,j:j+2) ));
        I(i,j)=sum(sum( F1.*A(i:i+2,j:j+2) ));
       
    end
end

Tt=I;
I=uint8(I);

figure,imshow(I);title('Filtered Image');


%Sharpenend Image
%Refer Equation in Fig.F
B=I1-I;
figure,imshow(B);title('Sharpened Image');



