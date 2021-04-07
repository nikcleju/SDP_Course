
% Compute and plot the impulse response of the system
x = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
y = filter_stsp(b, a, x, [0;0;0;0], 1);
stem(y)