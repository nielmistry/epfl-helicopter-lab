close all

data = load('simout.mat').ans;

t = data(1, :);
pitch = data(2, :);
yaw = data(3, :);
pitchdot = data(4, :);
yawdot = data(5, :);

pitch_ref = data(6, :);
yaw_ref = data(7, :);
pitchdot_ref = data(8, :);
yawdot_ref = data(9, :);

f = figure;
subplot(2,2,1)
plot(t, pitch_ref, "LineStyle", "--", 'DisplayName', "Reference")
hold on
plot(t, pitch, "DisplayName", "Pitch")
legend()
xlabel("Time (s)")
ylabel("Angle (rad)")
title("Pitch")

subplot(2,2,2)
plot(t, yaw_ref, "LineStyle", "--", 'DisplayName', "Reference")
hold on
plot(t, yaw, "DisplayName", "Yaw")
legend()
xlabel("Time (s)")
ylabel("Angle (rad)")
title("Yaw")

subplot(2,2,3)
plot(t, pitchdot_ref, "LineStyle", "--", 'DisplayName', "Reference")
hold on
plot(t, pitchdot, "DisplayName", "Pitch Rate")
legend()
xlabel("Time (s)")
ylabel("Angle Rate (rad/s)")
title("Pitch Rate")

subplot(2,2,4)
plot(t, yawdot_ref, "LineStyle", "--", 'DisplayName', "Reference")
hold on
plot(t, yawdot, "DisplayName", "Yaw Rate")
legend()
xlabel("Time (s)")
ylabel("Angle Rate (rad/s)")
title("Yaw Rate")
saveas(f, "mpc_performance_constraints.png")