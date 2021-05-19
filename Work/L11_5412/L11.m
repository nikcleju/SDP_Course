clear all
close all

% Exercise 1
delta = 0.001; % delta = 10^-3

s1 = delta*rand(1,10000) - delta/2;  % U[delta/2, delta/2]
%plot(s1)
s2 = delta*rand(1,10000);            % U[0, delta]
s3 = 2*delta*rand(1,10000) - delta;  % U[-delta, delta]

%plot([s1' s2' s3'])
plot(s1)
figure
plot(s2)
figure
plot(s3)

s1_m = mean(s1);
s1_v = var(s1);
s1_p = mean(s1.^2);

s2_m = mean(s2);
s2_v = var(s2);
s2_p = mean(s2.^2);

s3_m = mean(s3);
s3_v = var(s3);
s3_p = mean(s3.^2);

% Exercise 2
a = 0.1;
y(1) = s1(1); % at time 1: y(n) = a*0 + s1(1)
for n=2:10000
    y(n) = a*y(n-1) + s1(n);  % input x[n] = s1[n]
end

y_m = mean(y);
y_v = var(y);
y_p = mean(y.^2);

plot([s1', y'])

% Exercise 5

% Nicolae Cleju
i=1;
for a = 0.01:0.01:0.99  % a goes from 0.01 to 0.99 in steps of 0.01
    
    % Do filtering for every value of a
    y(1) = s1(1); % at time 1: y(n) = a*0 + s1(1)
    for n=2:10000
        y(n) = a*y(n-1) + s1(n);  % input x[n] = s1[n]
    end

    y_m = mean(y);
    y_v = var(y);
    y_p = mean(y.^2);
    
    Q(i) = y_p / s1_p;
    i = i+1;
end  
a_values = 0.01:0.01:0.99;
plot(a_values, Q)