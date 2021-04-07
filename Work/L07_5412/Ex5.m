% Let's call the function

% Plot the impulse response of the filter
x = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
%y = filter_stsp(b, a, x, [0;0;0;0]);
y = filter_stsp_weird(b, a, x, [0;0;0;0]);
stem(y)
