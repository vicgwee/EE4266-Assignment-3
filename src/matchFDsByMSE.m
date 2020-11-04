function Bd_matches = matchFDsByMSE(z_template, z_chars, Bd_chars, mse_threshold, n_coefs)

mse={};
for j = 1:length(z_template)
    for i = 1:length(z_chars)
        coefs_c = findMiddleCoefs(z_chars{i}, n_coefs);
        coefs_t = findMiddleCoefs(z_template{j}, n_coefs);
        %find RMSE between template and chars to list
        mse{end+1}=immse(coefs_t , coefs_c);
    end
end   
%evaluate MSE between template and chars
mse
Bd_matches = {};
for x = 1:(length(mse)/2)
    %MSE list has 112 elements. Set threshold as mse_threshold
    if mse{x}<mse_threshold || mse{x+length(mse)/2}<mse_threshold
        Bd_matches(end+1)=Bd_chars(x);
    end
end

end