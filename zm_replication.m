clc
close all
clear all

a = imread('H:\3-2 Term\matlab_works\rose3.jpg');

%method of replication
[m n s]= size(a);
for i=1:m*2
    for j=1:n*2
        p = i-floor(i/2);
        q = j-floor(j/2);
        result(i,j,:)= a(p,q,:);
    end
end

[m n s]= size(a);
for i=1:m/2
    for j=1:n/2
        p = i*2;
        q = j*2;
        b(i,j,:)=a(p,q,:);
    end
end   
figure;imshow(a),title('Real Image')
figure;imshow(result),title('Zoomed Image')
figure;imshow(b),title('Shrinked Image')


