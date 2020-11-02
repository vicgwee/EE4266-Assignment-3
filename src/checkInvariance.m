%%========================================================================%
%ORIGINAL
%FIND TEMPLATE FOURIER DESCRIPTORS
img_2 = imread('Template_2.bmp');
img_C = imread('Template_C.bmp');
z_2 = findTemplateFD(img_2);
z_C = findTemplateFD(img_C);
z_template = {z_2, z_C};

%PREPROCESS TEMPLATE FOURIER DESCRIPTORS
z_template_inv = makeInvariant(z_template);
plotFDs(z_template_inv, 'Template Invariant');

%%========================================================================%
%ROTATION
%FIND TEMPLATE FOURIER DESCRIPTORS
img_2 = imread('Template_2_r.bmp');
img_C = imread('Template_C_r.bmp');
z_2 = findTemplateFD(img_2);
z_C = findTemplateFD(img_C);
z_template_r = {z_2, z_C};

%PREPROCESS TEMPLATE FOURIER DESCRIPTORS
z_template_inv_r = makeInvariant(z_template_r);
plotFDs(z_template_inv_r, 'Template Invariant_Rotated');

%%========================================================================%
%TRANSLATION
%FIND TEMPLATE FOURIER DESCRIPTORS
img_2 = imread('Template_2_t.bmp');
img_C = imread('Template_C_t.bmp');
z_2 = findTemplateFD(img_2);
z_C = findTemplateFD(img_C);
z_template_t = {z_2, z_C};

%PREPROCESS TEMPLATE FOURIER DESCRIPTORS
z_template_inv_t = makeInvariant(z_template_t);
plotFDs(z_template_inv_t, 'Template Invariant_Translated');

%%========================================================================%
%SCALING
%FIND TEMPLATE FOURIER DESCRIPTORS
img_2 = imread('Template_2_s.bmp');
img_C = imread('Template_C_s.bmp');
z_2 = findTemplateFD(img_2);
z_C = findTemplateFD(img_C);
z_template_s = {z_2, z_C};

%PREPROCESS TEMPLATE FOURIER DESCRIPTORS
z_template_inv_s = makeInvariant(z_template_s);
plotFDs(z_template_inv_s, 'Template Invariant_Scaled');