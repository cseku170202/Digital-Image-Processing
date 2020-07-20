
%% Centralized 2D DFT without using built-in function
Img=double(imresize(imread('cameraman.tif'),0.3));

[Img_M,Img_N] = size(Img);
Output = zeros(Img_M,Img_N);
SumOutner = 0;
% Centralized 2D Discrete Fourier Transform
[nx,ny]=ndgrid([0:Img_M-1]-(Img_M-1)/2,[0:Img_N-1]-(Img_N-1)/2 );
du=1;
for u = [0:Img_M-1]-(Img_M-1)/2
    dv=1;
    for v = [0:Img_N-1]-(Img_N-1)/2
          SumOutner = sum(sum(Img.*exp(-1i*2*3.1416*(u*nx/Img_M+v*ny/Img_N))));
          Output(du,dv) = SumOutner;
          dv=dv+1;
    end
    du=du+1;
end
% Calculate Spectrum and show
figure;imshow(uint8(abs(Output)/60))

%% Centralized 2D IDFT without using built in function
Img=double(imresize(imread('cameraman.tif'),0.3));
[Img_M, Img_N] = size(Img);
Output=zeros(Img_M,Img_N);
SumOutner = 0;

% Centralized Inverse 2D Discrete Fourier Transform
[nx,ny]=ndgrid([0:Img_M-1]-(Img_M-1)/2,[0:Img_N-1]-(Img_N-1)/2 );
du=1;
for u = [0:Img_M-1]-(Img_M-1)/2
     dv=1;
     for v = [0:Img_N-1]-(Img_N-1)/2
          SumOutner=sum(sum(Img.*exp(1i*2*3.1416*(u*nx/Img_M+v*ny/Img_N))));
          Output(du,dv) = SumOutner;
          dv=dv+1;
     end
     du=du+1;
end

% Calculate Spectrum and show
figure;imshow(uint8(abs(Output)/60))


%% Centralized 2D DFT - Rotation in frequency domain vs rotation in spatial domain
Img=double(imresize(imread('cameraman.tif'),0.2));
Img=padarray(Img,[14 14],0,'both'); % pad zeros to retain information in original image and rotated image the same
t=0; % rotation angle in degrees
teta=t/180*pi; % rotation angle in radians
c1=cos(teta); s1=sin(teta);
[Img_M, Img_N] = size(Img);
rotDFT=zeros(Img_M,Img_N);
% Centralized rotated form of 2D Discrete Fourier Transform
SumOutner = 0;
[nx,ny]=ndgrid([0:Img_M-1]-(Img_M-1)/2,[0:Img_N-1]-(Img_N-1)/2 );
du=1;
for u = [0:Img_M-1]-(Img_M-1)/2
    dv=1;
    for v = [0:Img_N-1]-(Img_N-1)/2
         u2=(u);
         v2=(v);
         u1=u2*c1+v2*s1;
         v1=u2*-s1+v2*c1;
         SumOutner=sum(sum(Img.*exp(-1i*2*3.1416*(u1*nx/Img_M+v1*ny/Img_N))));
         rotDFT(du,dv) = SumOutner;
         dv=dv+1;
    end
    du=du+1;
end


% Calculate Spectrum and show
%imshow(uint8(abs(rotDFT)/60))



% find 2d IDFT
freq_rot_img=zeros(Img_M,Img_N);
SumOutner = 0;
du=1;
for u = [0:Img_M-1]-(Img_M-1)/2
    dv=1;
    for v = [0:Img_N-1]-(Img_N-1)/2
         SumOutner=sum(sum(rotDFT.*exp(1i*2*3.1416*(u*nx/Img_M+v*ny/Img_N))));
         freq_rot_img(du,dv) = SumOutner;
         dv=dv+1;
    end
    du=du+1;
end

freq_rot_img=freq_rot_img/(Img_M*Img_N); % normalization
% rotation in spatial domain
spat_rot_img=imrotate(Img,teta*180/pi,'bicubic','crop');


figure
subplot(2,2,1);imshow(uint8(abs(freq_rot_img)));title('Frequency domain image')
subplot(2,2,2);imshow(uint8(abs(spat_rot_img)));title('Spatial domain image')
subplot(2,2,3);imshow(uint8(abs(abs(freq_rot_img)-abs(spat_rot_img))));




