% 
%% FIND_THRUST_PITCH_FROM_YAW
% Finding the thrust torque constant acting on the pitch axis from applying
% a torque on the yaw axis
% 
%% load data
load('aero_pitch_from_yaw_step_rsp.mat');
t = step_rsp_py(1,:); % time (s)
u = step_rsp_py(2,:); % voltage (V)
y = step_rsp_py(3,:); % position (rad)
y_dot = step_rsp_py(4,:); % speed (rad/s)
% 
%% plot response and input
figure(4);
subplot(3,1,1);
plot(t,y,'linewidth',2);
ylabel('\theta (rad)');
subplot(3,1,2);
plot(t,y_dot,'linewidth',2);
ylabel('\omega_p (rad/s)');
subplot(3,1,3);
plot(t,u,'linewidth',2);
axis([0 5 -5 25]);
ylabel('V_y (V)');
xlabel('time (s)');
% 
% Export to image
% print(4,'-dpng','-r400','aero_pitch_from_yaw_step_rsp');
% 
%% Force/Torque Thrust Constant Estimate
quanser_aero_parameters;
% Torque = Jp*w_dot = Kpy*Vy --> Kpy = Jp*w_dot/Vy (N-m/V) 
dt = 1.83-1; % time from w0 to wmax
dw = 0.86-0; % wmax - wo (rad/s)
dV = 20; % step amplitude (V)
w_dot = dw/dt; % acceleration (rad/s^2)
% Cross-thrust: thrust acting on pitch axis from yaw voltage (N-m/V)
Kpy = (Jp*w_dot + Dy*dw)/dV % thrust torque (N-m/V), ex. -4.1825e-04
% 


