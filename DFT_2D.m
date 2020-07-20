

clc
clear all
close all

a = imread('cameraman.tif');
imshow(a);title('Original Image');
FT = fft2(a);

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

final = ifft2(FT);

figure;imshow(abs(mag),[]);title('Magnitude or Specrtrum)');
figure;imshow(abs(R),[]);title('Real Part');
figure;imshow(abs(I),[]);title('Imaginary Part');
figure;imshow(abs(L),[]);title('Log transform on spectrum');
figure;imshow(final,[]),title('Reconstructed Image');


