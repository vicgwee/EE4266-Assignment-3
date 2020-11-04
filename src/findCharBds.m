function Bd_chars = findCharBds(img)

%transform to gray image
if ndims(img) == 3
    img=rgb2gray(img);
end
%invert image
bwImg=1.-im2bw(img,graythresh(img));
Bd=bwboundaries(bwImg,8,'noholes'); 

[rows cols]=size(img);
imageDiagonal = sqrt(rows^2 + cols^2);
Bd_chars = filterBoundariesByDiagLength(Bd, 70, imageDiagonal- 70);

end