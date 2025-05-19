% Graph Generating Sketch used in Figure 2 for Problem 3:  
% Describe the signal shown in Figure 2 using the unit step function.
% Author: Strahinja Marinkovic
% Date: 3/10/2025

clear;
close all;

t = -1:0.01:5;
y1 = t .* (u(t) - u(t-2));
y2 = -2 .* (t - 3) .* [u(t-2) - u(t-3)];
y = y1 + y2;

plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
ylim([-0.1, 3]); 

xticks(-5:1:5); % More numbers on the x-axis (every 1 unit)
set(gca, 'FontSize', 12);