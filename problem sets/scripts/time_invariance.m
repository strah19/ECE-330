clear all;
t = linspace(0, 10*pi, 500);

T = 2;

x = [1 2 3 4 5];               
x_delayed = [zeros(1, T), x];   % Pad D zeros at the start

y = x_delayed(1:end-T);

figure;
hold on;
plot(y, 'k');
