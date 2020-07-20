
% program to find the 2D dft
% specially helpful for grayscale images
% program by: Deepak Kumar Rout
% vssut, Burla, India
clc;
clear all;
close all;
[filename, pathname, filterindex] = uigetfile( ...
{  '*.jpg','JPEG (*.jpg)'; ...
   '*.bmp','Windows Bitmap (*.bmp)'; ...
   '*.fig','Figures (*.fig)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Choose image(s) to be processed', ...
   'MultiSelect', 'off');
%if filterindex==0, break;end
filename=cellstr(filename);
im2= imread(horzcat(pathname,char(filename)));
%im2 = imread('cameraman.tif');
im1=rgb2gray(im2);
im3=im2double(im1);
[n,m]=size(im3);
c1=0;
h = waitbar(0,'Calculating DFT please wait......'); 
k=1;l=1;
for l=0:1:m-1
    for k=0:1:n-1
        for x=0:1:n-1
            for y=0:1:m-1
                a=x+1;b=y+1;
                c= im3(a,b) * exp(-1i*2*pi*(k*x/n + l*y/m));
                c1=c1+c;
            end
        end
        aa=l+1;bb=k+1;
        im(bb,aa)=c1;
        c1=0;
    end
    waitbar(l / m);
end
ims = im*255;
close(h)
imshow(ims);title('dft plot');
% figure
d=ifft2(im);
figure
imshow(log(abs(ims)),[-1 5]); colormap(jet); colorbar;title('absolute value of dft plot');
