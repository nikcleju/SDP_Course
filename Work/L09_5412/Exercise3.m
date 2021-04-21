% y[n] = 1/2 * y[n-1] + x[n]

fp = fixdt(1,8,5);  % 1 for sign, 8 total, 5 fractionary

x = mtlb_r;     % the input signal

% Compute the output signal
y(1) = x(1);  % at time n=1, assuming y(0) = 0
for n = 2:length(x)
    %y(n) = 0.5 * y(n-1) + x(n);
    temp = num2fixpt( 0.5 * y(n-1) , fp, [], 'Nearest');
    y(n) = num2fixpt( temp + x(n)  , fp, [], 'Nearest');
end

plot(y)
    