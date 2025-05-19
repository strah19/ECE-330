% Mass-Spring-Damper System with PID Control and Animation

% System Parameters
m = 1;      % Mass (kg)
c = 0.5;    % Damping coefficient (N·s/m)
k = 10;     % Spring constant (N/m)

% Initial conditions
x0 = 0;       % Initial position (m)
v0 = 0;       % Initial velocity (m/s)
setpoint = 1; % Desired position (m)

% PID Control Variables (Initial gains)
Kp = 0;
Ki = 0;
Kd = 0;

% Simulation Parameters
t_end = 1000;   % Simulation time (seconds)
dt = 0.01;    % Time step (seconds)
time = 0:dt:t_end;  % Time vector

% Initialize system state
x = x0;
v = v0;

% Create a UIFigure for live controls
fig = uifigure('Name', 'PID Controller Live Control', 'Position', [100, 100, 500, 350]);

% Create sliders and labels for live control of PID parameters
lbl_Kp = uilabel(fig, 'Position', [20 300 60 20], 'Text', 'Kp');
slider_Kp = uislider(fig, 'Position', [100 300 200 3], 'Limits', [0 100], 'Value', Kp);

lbl_Ki = uilabel(fig, 'Position', [20 250 60 20], 'Text', 'Ki');
slider_Ki = uislider(fig, 'Position', [100 250 200 3], 'Limits', [0 10], 'Value', Ki);

lbl_Kd = uilabel(fig, 'Position', [20 200 60 20], 'Text', 'Kd');
slider_Kd = uislider(fig, 'Position', [100 200 200 3], 'Limits', [0 100], 'Value', Kd);

% Create an axis for the animation plot
ax = axes(fig, 'Position', [0.1, 0.1, 0.8, 0.5]);
hold on;
xlim([-2, 10]);
ylim([-2, 2]);
title('Mass-Spring-Damper System Animation');
xlabel('Position (m)');
ylabel('Force (N)');

% Plot the initial setpoint line (dashed line for target position)
setpointLine = line([setpoint, setpoint], [-2, 2], 'Color', 'g', 'LineStyle', '--', 'LineWidth', 2);

% Create spring as a line
spring = plot([0, 0], [0, 0], 'b-', 'LineWidth', 2); % Spring line

% Create mass marker (red circle)
mass = plot(x, 0, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);

ax2 = axes(fig, 'Position', [0.1, 0.1, 0.8, 0.3]);
hold on;
xlabel('Time (s)');
ylabel('Position (m)');
title('Position x over Time');
grid on;
live_plot = plot(ax2, time(1), x0, 'b-', 'LineWidth', 2); % Initial plot

% Initialize PID variables
error_prev = 0;  % Previous error for derivative term
integral = 0;    % Integral term initialization

% Live updates during simulation
for i = 1:length(time)
    % Read current PID gains from sliders
    Kp = slider_Kp.Value;
    Ki = slider_Ki.Value;
    Kd = slider_Kd.Value;
    
    % PID Control Law
    error = setpoint - x;                      % Error (setpoint - actual position)
    integral = integral + error * dt;          % Integral term
    derivative = (error - error_prev) / dt;    % Derivative term
    u = Kp * error + Ki * integral + Kd * derivative; % Control signal (force)
    
    % Apply the control force (F = u) to the system
    F = u;
    
    % System dynamics (mass-spring-damper equation)
    a = (F - c * v - k * x) / m;    % Acceleration (from Newton's second law)
    v = v + a * dt;                  % Velocity update (Euler method)
    x = x + v * dt;                  % Position update (Euler method)
    
    % Update spring line (represent the spring between fixed point and mass)
    spring.XData = [0, x];
    spring.YData = [0, 0]; % Horizontal spring
    
    % Update the mass position in the animation
    mass.XData = x; % Update the x position of the mass
    
    if mod(i, 8) == 0
        live_plot.YData = [live_plot.YData, x];  % Append new position to the plot
        live_plot.XData = [live_plot.XData, time(i)]; % Append new time

        if i > 1
            xlim(ax2, [time(1), time(i)]);
        end
    end
    
    % Adjust the x-limits to follow the plot as time progresses


    % Pause for animation effect
    pause(dt);
    
    % Update previous error
    error_prev = error;
end
