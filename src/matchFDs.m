function Bd_matches = matchFDs(z_template, z_chars, Bd_chars, corr_threshold, n_coefs)

corr={};
for j = 1:length(z_template)
    for i = 1:length(z_chars)
        %find correlation matrix
        coefs_c = findMiddleCoefs(z_chars{i}, n_coefs);
        coefs_t = findMiddleCoefs(z_template{j}, n_coefs);
        R = corr2(coefs_t, coefs_c);
        %assign correlation coefficient between template and chars to list
        corr{end+1}=R;
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