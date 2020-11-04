function showBdsOnImg(Bd, img, txt, show_numbers)
%SHOWBDS Displays boundaries Bd on image image_name
    figure
    title1=sprintf(strcat(txt, ', %d boundaries'),length(Bd));
    imshow(img),title(title1); hold on;
    colors=['b' 'g' 'r' 'c' 'm' 'y'];
    for k=1:length(Bd),
        boundary = Bd{k};
        cidx = mod(k,length(colors))+1;
        plot(boundary(:,2), boundary(:,1),...
            colors(cidx),'LineWidth',2);
        if(show_numbers)
        %randomize text position for better visibility
            rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
            col = boundary(rndRow,2); row = boundary(rndRow,1);
            h = text(col+1, row-1, num2str(k));
            set(h,'Color',colors(cidx),'FontSize',16,'FontWeight','bold')
        end
    end
end