%% FIND_THRUST_PITCH
% Find the thrust torque constant for the pitch axis (from applying
% a torque on the pitch)
% 
%% load data
load('aero_pitch_free_osc_rsp.mat');
t = free_osc_rsp_pitch(1,:); % time (s)
u = free_osc_rsp_pitch(2,:); % voltage (V)
theta = free_osc_rsp_pitch(3,:); % position (rad)
omega = free_osc_rsp_pitch(4,:); % speed (rad/s)
acc = free_osc_rsp_pitch(5,:); % acceleration (rad/s^2)
% 
%% plot response
figure(1);
subplot(3,1,1);
plot(t,theta,'linewidth',2);
ylabel('\theta (rad)');
subplot(3,1,2);
plot(t,omega,'linewidth',2);
ylabel('\omega_p (rad/s)');
subplot(3,1,3);
plot(t,u,'linewidth',2);
axis([0 max(t) -25 5])
ylabel('u (V)');
xlabel('time (s)');
% 
% Export to image
% print(1,'-dpng','-r400','aero_pitch_free_osc_rsp');
% 
%% Finding Viscous Damping Coefficient and Stiffness
% free-oscillation: J*th_ddot + D*th_dot + K*th = th0
% theta(s) = th0 / (J*s^2+D*s+K) --> theta(s) = (J/D) / (s^2+D/J*s+K/J)
% using "s^2 + 2*zeta*wn + wn^2" standard 2nd order eqn:
% wn^2 = K/J and 2*zeta*wn=D/J --> K = J*wn^2 and D = 2*zeta*wn*J
% 
% 
%% Measure Oscillations
% note: use "ginput" command on Matlab figure
% Measure first overshoot
O1 = 0.644;
t1 = 5.23;
% Measure nth overshoot (s)
n = 4;
tn = 19.75;
On = 0.187;
%
%% Find Natural Frequency and Damping Ratio
quanser_aero_parameters;
% Oscillation period (s)
Tosc = (tn-t1) / (n-1);
% Subsidence ratio
% r21 = O2 / O1;
sigma = 1/n*log(O1/On);
% Damping ratio
% zeta = abs( log(r21) ) / sqrt(log(r21)^2 + pi^2);
zeta = 1 / sqrt(1 + 2*pi^2/sigma);
% Damped natural frequency (rad/s)
wd = 2*pi/Tosc;
% Undamped natural frequency (rad/s)
wn = wd / sqrt(1-zeta^2);
%
%% Find Stiffness and Damping
% Stiffness (N.m/rad)
Ksp_est = Jp*wn^2
% Damping (N.m/(rad/s))
Dp_est = 2*zeta*wn*Jp
% 