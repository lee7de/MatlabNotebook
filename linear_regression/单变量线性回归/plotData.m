function plotData(x, y)
% plots data points x and y into a new figure

figure; % open a new window

plot(x, y, 'rx', 'MarkerSize', 10); 
ylabel('profit in $10,000s'); %set the y-axis label
xlabel('Population of City in 10,000s'); %set the x-axis label
title('ex1data1.txt');

end
