function z = findTemplateFD(img)
%FINDTEMPLATEFD Returns z, the Fourier Coefficients of the template in img

%transform to gray image
if ndims(img) == 3
    img=rgb2gray(img);
end
 
[rows cols]=size(img);
%transform gray image to binary image (bwImg).
%As input image is RGB, resulting binary image may look a little different from
%original RGB image.
bwImg=im2bw(img,graythresh(img));

imageDiagonal = uint16(sqrt(rows^2 + cols^2));
Bd=bwboundaries(bwImg,8,'holes'); 
Bd_chars = filterBoundariesByDiagLength(Bd, 30, imageDiagonal- 30);

BdPoints=Bd_chars{1};
X=BdPoints(:,1);
Y=BdPoints(:,2);
noPts=length(X);

%discrete fourier transform
%s->original edge points,must be of size n-by-2.
%z->complex numbers, coefficients of fourier transform. 
s=[X Y];
z=frdescp(s);
end

