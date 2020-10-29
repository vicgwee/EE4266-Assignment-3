clear,clc;
img=imread('3_edge_large.bmp');
%transform to gray image
if isrgb(img)
    img=rgb2gray(img);
end

%percentage of fourier descriptors used to recover image
usedPercent=0.3;
 
[rows cols]=size(img);
%transfomr gray image to binary image (bwImg).
%As input image is RGB, resulting binary image may look a lit different from
%original RGB image.
bwImg=im2bw(img,graythresh(img));

% get the boundaries of binary image bwImg,alternatively, 4--connectivity,
%'ccw'--counter clockwise.X,Y store the coordinates of ordered boundary
%points.
Bd=findBoundary(bwImg,8,'cw'); 
BdPoints=Bd{1};
X=BdPoints(:,1);
Y=BdPoints(:,2);
noPts=length(X);

%%========================================================================%
%show original image in gray format
figure('Name','original image','NumberTitle','off');
title1=sprintf('original image,%d points',noPts);
imshow(img),title(title1);   


%%========================================================================%
%set true to save edge points(X,Y) to txt file
if 0
    f=fopen('3_edge.txt','w');
    for k=1:noPts
        fprintf(f,'%d\t%d\n',X(k),Y(k));
        dis_img(X(k),Y(k))=255;
    end
    fclose(f);
end


%%========================================================================%
%set true to display 8-connectivity edge points extraction step by step
if 0
    dis_img=zeros(rows,cols);
    figure('Name','8-connectivity edge points extraction','NumberTitle','off');
    for k=1:noPts
        dis_img(X(k),Y(k))=255;
        imshow(dis_img);
        pause(0.005);
    end
    imshow(dis_img),title('8-connectivity contour extraction');   
end



%discrete fourier transform
%s->original edge points,must be of size n-by-2.
%z->complex numbers, coefficients of fourier transform. 
s=[X Y];
z=frdescp(s);

%inverse fourier transform with part of fourier descriptors
%nr is total number of coefficients, within them, nb are used in recovery.
[nr,nc]=size(z);
nd=round(usedPercent*nr);

%s_recov -output of inverse fourier transform,coordinates of recovered edge
%points,n-by-2 format,n is same as original edge points number.
s_recov=ifrdescp(z,nd);
s_recov=uint16(s_recov);


%show recovered image
img1=zeros(rows,cols);
[rs cs]=size(s_recov);
for k=1:rs
    img1(s_recov(k,1),s_recov(k,2))=255;
end

%%show recovered image using part of fourier coefficients.
title2=sprintf('%d%% ( %d ) Fouier descriptors used',usedPercent*100,nd);
figure('Name','recovered image','NumberTitle','off');
imshow(img1),title(title2);