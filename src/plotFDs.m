function plotFDs(z, txt)
%PLOTFDS Plots the Fourier Descriptors on one figure

figure('Name', txt);

%Plot m x n subplots
n_plots = length(z);
m = round(sqrt(n_plots));
n = round(n_plots/m); 

if n_plots > m*n
    n = n + 1;
end

hold on;
for p=1:n_plots
    subplot(m,n,p);
    semilogy(findMiddleCoefs(abs(z{p}),20));
end
hold off;

end

