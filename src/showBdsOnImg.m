function showBdsOnImg(Bd, img)
%SHOWBDS Displays boundaries Bd on image image_name
    title1=sprintf('Original image,%d boundaries',length(Bd));
    imshow(img),title(title1); hold on;
    colors=['b' 'g' 'r' 'c' 'm' 'y'];
    for k=1:length(Bd),
        boundary = Bd{k};
        cidx = mod(k,length(colors))+1;
        plot(boundary(:,2), boundary(:,1),...
            colors(cidx),'LineWidth',2);
    end
end