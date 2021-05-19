%clear all
%close all

% Exercise 1
delta = 0.001;

s1 = delta*rand(1, 10000)   - delta/2;   % U [-delta/2, delta/2] 
plot(s1)
s2 = delta*rand(1, 10000)   - delta;     % U [-delta, 0] 
figure
plot(s2)
s3 = delta*2*rand(1, 10000) - delta;     % U [-delta, delta] 
figure
plot(s3)

s1_m = mean(s1);     % average value = mean(...)
s1_v = var(s1);      % variance  = var(...)
s1_p = mean(s1.^2);  % average squared value = average power

s2_m = mean(s2);     % average value = mean(...)
s2_v = var(s2);      % variance  = var(...)
s2_p = mean(s2.^2);  % average squared value = average power

s3_m = mean(s3);     % average value = mean(...)
s3_v = var(s3);      % variance  = var(...)
s3_p = mean(s3.^2);  % average squared value = average power


% Exercise 2
% Nicolae Cleju
a = 0.99;
y(1) = s1(1);
for n=2:10000
    y(n) = a * y(n-1) + s1(n);   % Input x[n] = s1[n]
end
y_m = mean(y);     % average value = mean(...)
y_v = var(y);      % variance  = var(...)
y_p = mean(y.^2);  % average squared value = average power

plot([s1' y']);  % Plot on the same figure

% Exercise 3
timevalues = linspace(0, 10, 10000);
s1input = [timevalues' s1'];

% Compute output power based in the output from simulink
simout_p = mean((out.newsimout).^2);