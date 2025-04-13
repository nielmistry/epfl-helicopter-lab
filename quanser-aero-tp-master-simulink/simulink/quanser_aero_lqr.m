% Load model parameters
quanser_aero_parameters;

% Load state-space matrices 
quanser_aero_state_space;

%% State-Feedback LQR Control Design
Q = 1000*diag([100 10 100 10]);
R = diag([100 100]);

K = lqr(A,B,Q,R)