

clc
clear all
close all
%H:\3-2 Term\matlab_works\rose4.png
%f = imread('H:\3-2 Term\matlab_works\car.jpg');
%a = rgb2gray(f);
a = imread('cameraman.tif');
imshow(a);

[r,c,o]=size(a);

for x=1:r
    for y=1:c
        b(x,y) = a(x,y)*((-1).^(x+y));
    end
end

F = fft2(b);
R = real(F);
I = imag(F);
mag = sqrt(R.^2+I.^2);

L = 2*log(1+mag);

F = fft2(a);
Fsh = fftshift(F);
F1 = ifftshift(Fsh);
f1 = ifft2(F1);

figure;imshow(abs(mag),[]);title('Fourier Transform');
figure;imshow(abs(R),[]);title('Real Part');
figure;imshow(abs(I),[]);title('Imaginary Part');
figure;imshow(abs(L),[]);title('Log transform on spectrum');
figure(6);imshow(f1,[]),title('reconstructed Image')




