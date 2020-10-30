function Bd_matches = matchFDs(z_template, z_chars, Bd_chars)
corr={};
for i = 1:length(z_chars)
    for j = 1:length(z_template)
        %find correlation matrix
        R = corrcoef(z_template{j}(length(z_template{j})/2-10:length(z_template{j})/2+10,1),z_chars{i}(length(z_chars{j})/2-10:length(z_chars{j})/2+10,1));
        %assign correlation coefficient between template and chars to list
        corr{end+1}=R(2,1);
    end
end       
%evaluate correlation coefficient between template and chars
for x = 1:(length(corr)/2)
    %corr list has 112 elements. Set threshold as ___
    if corr{x}>0 || corr{x+56}>0
        Bd_matches(x)=Bd_chars(x);
    end
end

end