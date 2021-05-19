clear all
close all

% Exercise 3
N = 10000;            % Parameters
f1 = 1000/44100;
f2 = 1800/44100;
A = 1.5;
% Create the signal
n = 0:N-1; % is a vector
x = cos(2*pi*f1*n) + 0.5 * cos(2*pi*f2*n) + A*randn(1,N);
plot(x)

% Exercise 4
% Method 1: modulus of the Fourier transform, squared
S = fft(x);
Pxx = abs(S).^2;
plot(Pxx)

%Nicolae Cleju

% Method 2: use the function periodogram()
pxx = periodogram(x);
figure
plot(pxx)

% Method 3: use Yule-Walker method
pxx = pyulear(x, 100);
figure
plot(pxx);