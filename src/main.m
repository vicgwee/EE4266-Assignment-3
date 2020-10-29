%%========================================================================%
%FIND TEMPLATE FOURIER DESCRIPTORS
img_2 = imread('Template_2.bmp');
img_C = imread('Template_C.bmp');
z_2 = findTemplateFD(img_2);
z_C = findTemplateFD(img_C);
z_template = {z_2, z_C};

%%========================================================================%
%PREPROCESS TEMPLATE FOURIER DESCRIPTORS

%Scale Invariance by normalising

%Rotation Invariance by taking Magnitude

%Translation Invariance by ignoring first coefficient

%=========================================================================%
%FIND CHARACTER BOUNDARIES IN IMAGE
img_a4 = imread('a4.bmp');
Bd = findCharBds(img_a4);

if 1
    showBdsOnImg(Bd, img_a4);
end

%=========================================================================%
%COMPARE FOURIER DESCRIPTORS OF CHARACTERS WITH TEMPLATES


%=========================================================================%
%DISPLAY BOUNDARIES OF MATCHING CHARACTERS ON IMAGE
