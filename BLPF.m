

a=imread('H:\3-2 Term\matlab_works\rose4.png');
f=rgb2gray(a);
P=30;
n=1;
[M,N,O]=size(f);
F=fft2(double(f));

A = real(F);
B = imag(F);
C = sqrt(A.^2+B.^2)
%figure;imshow(C,[]);title('Fourier transform of an image');

Fsh = fftshift(F);
R = real(Fsh);
S = imag(Fsh);
T = sqrt(R.^2+S.^2)
figure;imshow(abs(T),[]);title('Centered fourier transform of Image')

u=0:(M-1);
v=0:(N-1);
idx=find(u>M/2);
u(idx)=u(idx)-M;
idy=find(v>N/2);
v(idy)=v(idy)-N;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);


H = 1 ./ (1.0 + (D ./ P).^(2*n));

Fsh = fftshift(H);
R1 = real(Fsh);
S1 = imag(Fsh);
T1 = sqrt(R1.^2+S1.^2)
figure;imshow(abs(T1),[]);title('Transform Function where Do=30 and n=2');
G=F;
for i = 1:O
    G(:,:,i) = H.*F(:,:,i);
end
g=uint8(real(ifft2(double(G))));
figure;imshow(f),title('Original Image');
figure,imshow(g);title('Bluured Image(Butterworth)');

