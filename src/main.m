%%========================================================================%
%FIND TEMPLATE FOURIER DESCRIPTORS
z_2 = findTemplateFD('Template_2.bmp');
z_C = findTemplateFD('Template_C.bmp');
z_template = {z_2, z_C};

%%========================================================================%
%PREPROCESS TEMPLATE FOURIER DESCRIPTORS

%Scale Invariance by normalising

%Rotation Invariance by taking Magnitude

%Translation Invariance by ignoring first coefficient

%=========================================================================%
%FIND CHARACTER BOUNDARIES IN IMAGE
Bd = findCharBds('a4.bmp');

%=========================================================================%
%COMPARE FOURIER DESCRIPTORS OF CHARACTERS WITH TEMPLATES


%=========================================================================%
%DISPLAY BOUNDARIES OF MATCHING CHARACTERS ON IMAGE
