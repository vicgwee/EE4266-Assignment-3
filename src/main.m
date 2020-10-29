%%========================================================================%
%FIND TEMPLATE FOURIER DESCRIPTORS
img_2 = imread('Template_2.bmp');
img_C = imread('Template_C.bmp');
z_2 = findTemplateFD(img_2);
z_C = findTemplateFD(img_C);
z_template = {z_2, z_C};

%%========================================================================%
%PREPROCESS TEMPLATE FOURIER DESCRIPTORS
z_template = makeInvariant(z_template);

%=========================================================================%
%FIND CHARACTER BOUNDARIES IN IMAGE
img_a4 = imread('a4.bmp');
Bd = findCharBds(img_a4);

if 0
    showBdsOnImg(Bd, img_a4);
end

%FIND FOURIER DESCRIPTORS OF EACH CHARACTER
z_chars = {};
for i=1:size(Bd)
    z_chars{end+1} = frdescp(Bd{i});
end
z_chars = makeInvariant(z_chars);

%=========================================================================%
%COMPARE FOURIER DESCRIPTORS OF CHARACTERS WITH TEMPLATES
z_matches = matchFDs(z_template,z_chars);

%=========================================================================%
%DISPLAY BOUNDARIES OF MATCHING CHARACTERS ON IMAGE

%percentage of fourier descriptors used to recover image
usedPercent=0.15;

Bd_matches = {};
for i=1:size(z_matches, 2)
    Bd_matches{end+1} = ifrdescp(z_matches{i},round(size(z_matches{i},1)*usedPercent));
end

showBdsOnImg(Bd_matches, img_a4);
