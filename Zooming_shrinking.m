function bilinear_zoom();
clc
clear all
close all

a=imread('H:\3-2 Term\matlab_works\rose.jpeg');
[row col d] = size(a);

zoom=3;       
zr=zoom*row;
zc=zoom*col;

%bilinear interpolation of zooming
for i=1:zr
    
    x=i/zoom;
    
    x1=floor(x);
    x2=ceil(x);
    if x1==0
        x1=1;
    end
    xint=rem(x,1);
    for j=1:zc   
        
        y=j/zoom;
        
        y1=floor(y);
        y2=ceil(y);
        if y1==0
            y1=1;
        end
        yint=rem(y,1);
        
        BL=a(x1,y1,:);
        TL=a(x1,y2,:);
        BR=a(x2,y1,:);
        TR=a(x2,y2,:);
        
        R1=BR*yint+BL*(1-yint);
        R2=TR*yint+TL*(1-yint);
        
        im_zoom(i,j,:)=R1*xint+R2*(1-xint);
    end
end   
%bilinear interpolation ends

%nearest neighbour interpolation stars
[row1 col1 d1] = size(a);
zoom = 3;
zr1=zoom*row1;
zc1=zoom*col1;

for i = 1:1:zr1;
    x = i/zoom;
    mapi = round(x);
    if mapi==0
        mapi = 1;
    end
      
        for j = 1:1:zc;
            y = j/zoom;
            mapj = round(y);
            if mapj==0
                mapj = 1;
            end
            imgzoom(i,j,:)= a(mapi,mapj,:);
        end
end
%nearest neighbour interpolation end

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

%method of replication ends

figure;imshow(a),title('Real Image')
figure;imshow(im_zoom),title('Zoomed Image(Bilinear interpolation)')
figure;imshow(imgzoom),title('Zoomed Image(Neighbour interpolation)')
figure;imshow(result),title('Zoomed Image(Replication method)')
figure;imshow(b),title('Shrinked Image')
end


                

