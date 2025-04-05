% 
%% FIND_THRUST_YAW_FROM_PITCH
% Finding the thrust torque constant acting on the yaw axis from applying
% a torque on the pitch axis
% 
%% load data
load('aero_yaw_from_pitch_step_rsp.mat');
t = step_rsp_yp(1,:); % time (s)
u = step_rsp_yp(2,:); % voltage (V)
y = step_rsp_yp(3,:); % position (rad)
y_dot = step_rsp_yp(4,:); % speed (rad/s)
% 
%% plot response and input
figure(3);
subplot(3,1,1);
plot(t,y,'linewidth',2);
axis([0 5 -8 1]); 
ylabel('\psi (rad)');
subplot(3,1,2);
plot(t,y_dot,'linewidth',2);
axis([0 5 -3 1]); 
ylabel('\omega_y (rad/s)');
subplot(3,1,3);
plot(t,u,'linewidth',2);
axis([0 5 -5 25]);
ylabel('V_p (V)');
xlabel('time (s)');
% 
% Export to image
print(3,'-dpng','-r400','aero_yaw_from_pitch_step_rsp');
% 
%% Force/Torque Thrust Constant Estimate
quanser_aero_parameters;
% Torque = Jy*w_dot = Kyp*Vp --> Kyp = Jp*w_dot/Vp (N-m/V) 
% Torque = Jy*w_dot = Kyp*Vp --> Kyp = Jp*w_dot/Vp (N-m/V) 
dt = 5-1; % time from w0 to wmax
dw = -1.95-0; % wmax - wo (rad/s)
dV = 20; % step amplitude (V)
w_dot = dw/dt; % acceleration (rad/s^2)
% Cross-thrust: thrust acting on pitch axis from yaw voltage (N-m/V)
Kyp = (Jy*w_dot + Dy*dw)/dV % thrust torque (N-m/V), ex. 2.6356e-04
