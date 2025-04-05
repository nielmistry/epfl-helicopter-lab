% 
%% FIND_THRUST_YAW
% Find the thrust torque constant for the yaw axis (from applying
% a yaw on the pitch)
% 
%% load data
load('aero_yaw_step_rsp.mat');
t = step_rsp_yaw(1,:); % time (s)
u = step_rsp_yaw(2,:); % voltage (V)
theta = step_rsp_yaw(3,:); % position (rad)
omega = step_rsp_yaw(4,:); % speed (rad*s)
% 
%% plot response and input
figure(2);
subplot(3,1,1);
plot(t,theta,'linewidth',2);
axis([0 5 -0.5 6])
ylabel('\psi (rad)');
subplot(3,1,2);
plot(t,omega,'linewidth',2);
ylabel('\omega_y (rad/s)');
subplot(3,1,3);
plot(t,u,'linewidth',2);
axis([0 5 -5 25])
ylabel('u (V)');
xlabel('time (s)');
% 
% Export to image
print(2,'-dpng','-r400','aero_yaw_step_rsp');
% 
%% Force Thrust Constant Estimate
quanser_aero_parameters;
% Torque = Jy*w_dot = Kyy*Vy --> Kyy = Jy*w_dot/Vy (N-m/V)  
dt = 5-1; % time from w0 to wmax
dw = 1.57-0; % wmax - wo (rad/s)
dV = 20; % step amplitude (V)
w_dot = dw/dt; % acceleration (rad/s^2)
Kyy = (Jy*w_dot + Dy*dw)/dV % thrust torque (N-m/V)
% Kyy/r_prop % thrust force (N/V)
