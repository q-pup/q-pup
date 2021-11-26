desired_linear_speed = 1.4; % m/s
Kv_motor = 100; % select this based on torque reqs
gear_reduction = 10; % select this based on torque reqs

upper_leg_length = 0.4;
lower_leg_length = 0.35;

gait_knee_angle = deg2rad(90);
gait_hip_swing_angle = deg2rad(3.5) + deg2rad(30); % unrealistic but large values yield less efficient steps so it just goes into fs

effective_leg_length = sqrt(upper_leg_length^2 + lower_leg_length^2 -2*upper_leg_length*lower_leg_length*cos(deg2rad(180)-gait_knee_angle));

% HUGE simplifying assumptions here. ignores that linear speed of step
% isn't linearly proportional to angular vel... amoung many other
% assumptions
effective_step_length = effective_leg_length*sin(gait_hip_swing_angle);

% more OMEGA BIG simplifications
desired_ang_vel = desired_linear_speed / effective_step_length * gait_hip_swing_angle; %rads/s

min_motor_voltage = desired_ang_vel/(Kv_motor / 60 * 2 * pi / gear_reduction);
