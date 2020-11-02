function B_chars = filterBoundariesByDiagLength(B_raw, min_diag, max_diag)
%filterBoundariesByDiagLength Returns B_chars, subset of array B_raw with diagonal within min_diag and max_diag
%   Detailed explanation goes here
B_chars = {};
for i = 1:length(B_raw)
    bounding_pts = B_raw{i};
    if size(bounding_pts,1) >= 4     % need at least 4 pixels to form a boundary around 1 pixel
        x = bounding_pts(:,1);
        y = bounding_pts(:,2);
        diag = sqrt((max(x) - min(x))^2 + (max(y) - min(y))^2);
        if diag > min_diag && diag < max_diag
            B_chars{end+1, 1} = bounding_pts;
        end
    end
end
end

