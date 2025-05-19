clear all;

syms s t u
Kd = 100;
Ki = 100;
Kp = 1000;
m = 1;
d = 0.5;
k = 10;
X = (((Kd * s^2) + (s * Kp) + Ki) / ((m * s^3) + (d * s^2) + (k*s)) * (10/s)) / (1 + ((Kd * s^2) + (s * Kp) + Ki) / ((m * s^3) + (d * s^2) + (k*s)));
x = ilaplace(X, s, t)
u = 10;

disp(['Time-domain expression: ', char(x)]);

hold on

% Plot the function
fplot(x, [0, 20]); % Plot for t from 0 to 5
fplot(u, [0, 20], 'r'); % Plot for t from 0 to 5

xlabel('Time (t)');
ylabel('x(t)');
title('Inverse Laplace Transform');
grid on;


clc; clear; close all;
syms s t

% Given PID Gains
Kd = 8.9868;
Ki = 31.622;
Kp = 20;

% Mass-Spring-Damper Parameters
m = 1;
d = 0.5;
k = 10;

% Transfer Function (Laplace Domain)
num = [Kd, Kp, Ki];  % PID numerator coefficients
den = [m, d, k, 0];  % System denominator coefficients (added 0 for s term)

% Create Transfer Function Model
G = tf(1, den);      % Plant transfer function
C = tf(num, [1 0]);  % PID controller transfer function (assuming Ki/s)

% Open-Loop System
L = C * G; 

% Root Locus Plot
figure;
rlocus(L);  
grid on;
title('Root Locus of the System');

% Interactive Gain Selection
disp('Click on the root locus plot to select a gain.');
[K, poles] = rlocfind(L);
disp(['Selected Gain: ', num2str(K)]);
disp(['Closed-loop Poles: ', num2str(poles.')]);

% Once you select the gain, you can use it to calculate the closed-loop response

% Use the selected gain (K) for the closed-loop transfer function
T = feedback(K * L, 1);  % Closed-loop system

% Compute Time-Domain Response
[x, t] = step(T, 50);  % Step response over 20 seconds

% Plot Time-Domain Response
figure;
plot(t, x, 'b', 'LineWidth', 1.5);
xlabel('Time (t)');
ylabel('x(t)');
title('Step Response of the Closed-Loop System');
grid on;



