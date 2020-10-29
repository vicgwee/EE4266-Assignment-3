clear,clc;
img=imread('Template_2.bmp');
%transform to gray image
if ndims(img) == 3
    img=rgb2gray(img);
end

%percentage of fourier descriptors used to recover image
usedPercent=0.15;
 
[rows cols]=size(img);
%transform gray image to binary image (bwImg).
%As input image is RGB, resulting binary image may look a little different from
%original RGB image.
bwImg=im2bw(img,graythresh(img));

% get the boundaries of binary image bwImg,alternatively, 4--connectivity,
%'ccw'--counter clockwise.X,Y store the coordinates of ordered boundary
%points.
Bd=bwboundaries(bwImg,8,'holes'); 
Bd_chars = filterBoundariesByDiagLength(Bd, 30, 500);

%%========================================================================%
%set true to show Bd_chars boundaries
if 1
    title1=sprintf('Original image,%d boundaries',length(Bd_chars));
    imshow(img),title(title1); hold on;
    colors=['b' 'g' 'r' 'c' 'm' 'y'];
    for k=1:length(Bd_chars),
      boundary = Bd_chars{k};
      cidx = mod(k,length(colors))+1;
      plot(boundary(:,2), boundary(:,1),...
           colors(cidx),'LineWidth',2);
    end
end

%%========================================================================%
%select one boundary in Bd_chars for Fourier transform
BdPoints=Bd_chars{2};
X=BdPoints(:,1);
Y=BdPoints(:,2);
noPts=length(X);

%%========================================================================%
%set true to save edge points(X,Y) to txt file
if 0
    f=fopen('a4_edge.txt','w');
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

img1=zeros(rows,cols);
[rs cs]=size(s);
for k=1:rs
    img1(s(k,1),s(k,2))=255;
end
%%show originalimage using part of fourier coefficients.
title2=sprintf('Fourier descriptors used');
figure('Name','original image','NumberTitle','off');
imshow(img1),title(title2);

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
title2=sprintf('%d%% ( %d ) Fourier descriptors used',usedPercent*100,nd);
figure('Name','recovered image','NumberTitle','off');
imshow(img1),title(title2);