% Generates sketchs for Problem 2 solutions.  
% Sketch the following signals (check your work using MATLAB):
% Author: Strahinja Marinkovic
% Date: 3/10/2025

clear;
close all;

t = -10:0.01:10;

% Part A
y = u(t-5) - u(t-7);
figure
subplot(2, 3, 1);
plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
title('Part A');
ylim([-0.1, 1.1]); 

% Part B
y = u(t-5) + u(t-7);

subplot(2, 3, 2);
plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
title('Part B');
ylim([-0.1, 2.1]); 

% Part C
y = t.^2 .* (u(t-1) - u(t-2));

subplot(2, 3, 3);
plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
title('Part C');
ylim([-0.1, 4.1]); 

% Part D
y = (t - 4) .* (u(t - 2) - u(t - 4));

subplot(2, 3, 4);
plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
title('Part D');
ylim([-2.1, 0.1]); 

% Part E
y = 2*t .* (u(t + 2) - u(t - 1));

subplot(2, 3, 5);
plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
title('Part E');
ylim([-4.1, 2.1]); 

% Part F
y = zeros(1, length(t));
for N = -10:10
    y = y + ((u(t - (N - 1)) - u(t - N)) .* (-1)^N);
end

subplot(2, 3, 6);
plot(t, y, "k", 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('y(t)');
title('Part F');
ylim([-1.1, 1.1]); 
