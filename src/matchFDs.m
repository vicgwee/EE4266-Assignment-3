function Bd_matches = matchFDs(z_template, z_chars, Bd_chars)
corr_threshold = 0.95;
n_coefs = 8;
corr={};
for i = 1:length(z_chars)
    coefs_c = findMiddleCoefs(z_chars{i}, n_coefs);
    for j = 1:length(z_template)
        %find correlation matrix
        coefs_t = findMiddleCoefs(z_template{j}, n_coefs);
        R = corrcoef(coefs_t, coefs_c);
        %assign correlation coefficient between template and chars to list
        corr{end+1}=R(2,1);
    end
end   

%evaluate correlation coefficient between template and chars
Bd_matches = {};
for x = 1:(length(corr)/2)
    %corr list has 112 elements. Set threshold as ___
    
    if corr{x}>corr_threshold || corr{x+length(corr)/2}>corr_threshold
        Bd_matches(end+1)=Bd_chars(x);
    end
end

end