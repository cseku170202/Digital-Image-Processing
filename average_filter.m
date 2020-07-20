clc
clear all
close all

b = imread('cameraman.tif');
%b = rgb2gray(a);
%imshow(b);
[r c]=size(b);

result = zeros(256,256,'uint8');
w = ones(3,3)/9;

for i=2:r-1
    for j=2:c-1
        s = 0;
        for r1=1:3
            for c1=1:3
                s = s+w(r1,c1)*b(i+r1-2,j+c1-2);
            end
        end
        result(i-1,j-1)= s;
    end
end

figure;
imshow(b),title('Original Image');
figure;
imshow(result),title('Smoothen Image');

        
        