clc; clear; close all;

dt = 0.001;
t = -2:dt:2;

% x(t) is some arbitrary signal
B = 2 * pi * 50
x = 1 .* sinc(B .* t).^2;

Fs = 1/dt;                      % Sampling frequency

% Compute FFT and frequency axis
X_f = fftshift(fft(x));       % Centered FFT
f = linspace(-Fs/2, Fs/2, length(t));  % Frequency vector

figure
% Plot magnitude spectrum
plot(f, abs(X_f), 'k', 'LineWidth', 1.2)
title('Frequency Domain of x(t)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')

grid on

% plot s(t), the sampling signal

T = 1/150;
T0 = 1/1500;

% Duty cycle
D = (2*T0/T) * 100;

% Time vector — a few periods for visualization
t = linspace(-3*T, 3*T, 1000);

phase_shift = T0;

% Generate square wave with amplitude from 0 to 1, and pulse centered at t=0
% Shift by T/2 so that the "1" region is centered at t=0
s = 0.5 * (square(2*pi*(1/T)*(t + phase_shift), D) + 1);

% Plot
figure;
plot(t, s, 'k', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('s(t)');
title('Pulse Train');
grid on;
ylim([-0.2, 1.2]);

x_w = 2 * pi * (1 / (T));

x = 3 .* cos((1/3)*x_w .* t) + 7 .* sin((1/4)*x_w .* t);
figure
plot(t, x, 'k', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('x(t)');
title('x(t)');

figure
v = x .* s;
plot(t, v, 'k', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('v(t)');
title('v(t)');

