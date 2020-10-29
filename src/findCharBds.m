function Bd_chars = findCharBds(img)

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
imageDiagonal = sqrt(size(bwImg,1)^2 + size(bwImg,2)^2);
Bd=bwboundaries(bwImg,8,'holes'); 
Bd_chars = filterBoundariesByDiagLength(Bd, 30, imageDiagonal- 30);

end