% Graph Generating Sketch used in Figure for Problem 4:  
% Describe the signal shown in the Figure using the unit step function.
% Author: Strahinja Marinkovic
% Date: 3/10/2025

clear;
close all;

t = -1:0.01:5;
y = (t - 1) .* u(t - 1) - (t - 2) .* u(t - 2) - u(t - 4);

plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
ylim([-0.1, 3]); 

xticks(-5:1:5); % More numbers on the x-axis (every 1 unit)
set(gca, 'FontSize', 12);