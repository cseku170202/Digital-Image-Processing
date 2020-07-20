

a=imread('H:\3-2 Term\matlab_works\rose3.jpg');
f=rgb2gray(a);
P=50;
[M,N,O]=size(f);
F=fft2(double(f));

A = real(F);
B = imag(F);
C = sqrt(A.^2+B.^2)


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

