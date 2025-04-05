%% FIND_THRUST_PITCH
% Find the thrust torque constant for the pitch axis (from applying
% a torque on the pitch)
% 
%% load data
load('aero_pitch_step_rsp.mat');
t = step_rsp_pitch(1,:); % time (s)
u = step_rsp_pitch(2,:); % voltage (V)
theta = step_rsp_pitch(3,:); % position (rad)
omega = step_rsp_pitch(4,:); % speed (rad/s)
% 
%% plot response and input
figure(1);
subplot(3,1,1);
plot(t,theta,'linewidth',2);
ylabel('\theta (rad)');
subplot(3,1,2);
plot(t,omega,'linewidth',2);
ylabel('\omega_p (rad/s)');
subplot(3,1,3);
plot(t,u,'linewidth',2);
axis([0 5 -5 25]);
ylabel('u (V)');
xlabel('time (s)');
% 
% Export to image
% print(1,'-dpng','-r400','aero_pitch_step_rsp');
% 
%% Force Thrust Constant Estimate
quanser_aero_parameters;
% Torque = Jp*w_dot = Kpp*Vp --> Kpp = J*w_dot/Vp (N-m/V) 
dt = 2.30-1; % time from w0 to wmax
dw = 0.926-0; % wmax - wo (rad/s)
dV = 20; % step amplitude (V)
w_dot = dw/dt; % acceleration (rad/s^2)
Kpp = (Jp*w_dot + Dp*dw)/dV % thrust torque (N-m/V) 
% 

