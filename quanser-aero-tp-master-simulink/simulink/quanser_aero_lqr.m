% Load model parameters
quanser_aero_parameters;

% Load state-space matrices 
quanser_aero_state_space;

%% State-Feedback LQR Control Design
Q = [];
R = [];

K = lqr(A,B,Q,R)