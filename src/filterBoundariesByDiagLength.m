function B_chars = filterBoundariesByDiagLength(B_raw, min_l, max_l)
%filterBoundariesByDiagLength Returns B_chars, subset of array B_raw with
%diagonal within min_l and max_l
%   Detailed explanation goes here
B_chars = {};
for i = 1:length(B_raw)
    bounding_pts = B_raw{i};
    if size(bounding_pts,1) > 5     
        x = bounding_pts(:,1);
        y = bounding_pts(:,2);
        diagonal = sqrt((max(x) - min(x))^2 + (max(y) - min(y))^2);
        if diagonal > min_l && diagonal < max_l
            B_chars{end+1, 1} = bounding_pts;
        end
    end
end
end

