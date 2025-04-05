%% FIND_THRUST_PITCH
% Find the thrust torque constant for the pitch axis (from applying
% a torque on the pitch)
% 
%% load data
load('aero_yaw_free_osc_rsp.mat');
t = free_osc_rsp_yaw(1,:); % time (s)
u = free_osc_rsp_yaw(2,:); % voltage (V)
theta = free_osc_rsp_yaw(3,:); % position (rad)
omega = free_osc_rsp_yaw(4,:); % speed (rad/s)
acc = free_osc_rsp_yaw(5,:); % acceleration (rad/s^2)
% 
%% plot response
figure(1);
subplot(3,1,1);
plot(t,theta,'linewidth',2);
axis([0 max(t) -0.1 1.5]);
ylabel('\psi (rad)');
subplot(3,1,2);
plot(t,omega,'linewidth',2);
axis([0 max(t) -0.1 0.75]);
ylabel('\omega_y (rad/s)');
subplot(3,1,3);
plot(t,u,'linewidth',2);
axis([0 max(t) -5 25])
ylabel('u (V)');
xlabel('time (s)');
% 
% Export to image
print(1,'-dpng','-r400','aero_yaw_free_osc_rsp');
% 
%% Viscous Damping Coefficient Estimate
quanser_aero_parameters;
% free-oscillation: J*w_dot*s + D*w_dot = w0
% w(s) = J/(J*s+D) --> w(s) = (J/D) / (J/D*s+1)
% find 63% of final value
w0 = 0.56; % first positive peak
t0 = 2.06; % time of first peak
wf = 0; % final value
w1 = (1-0.63)*w0; % 63% of final value (0)
t1 = 3.06; % time it takes to decay to 63% of final value
tau_y = t1-t0;
Dy_est = Jy/tau_y
% 