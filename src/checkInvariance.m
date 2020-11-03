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


%VISUALISE DIFFERENCES
if 1
    plotFDs(z_template_inv, 'Template Invariant');
    plotFDs(z_template_inv_r, 'Template Invariant_Rotated');
    plotFDs(z_template_inv_t, 'Template Invariant_Translated');
    plotFDs(z_template_inv_s, 'Template Invariant_Scaled');
end

%FIND RMSE
n_coefs = 10;

z_tests = {z_template_inv_r, z_template_inv_t, z_template_inv_s};

results = (0)
for i=1:3
    z_test = z_tests{i};
    for j=1:2
        coefs_test = findMiddleCoefs(abs(z_test{j}),n_coefs);
        coefs_temp = findMiddleCoefs(abs(z_template_inv{j}),n_coefs);
        results(i,j)= immse(coefs_test,coefs_temp);
    end
end

results