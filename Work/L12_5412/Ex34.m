clear all
close all

% Exercise 3
f1 = 1000/44100;
f2 = 1800/44100;
n = 0:999;
A = 1;
x = cos(2*pi*f1*n) + 0.5 * cos(2*pi*f2*n) + A*randn(1,1000);
plot(x)

% Exercise 4

% Method 1: use fft()
y = fft(x);
plot(abs(y).^2) % Modulus squared of Fourier transform of x

% Method 2: use periodogram()
pxx = periodogram(x);
figure
plot(pxx)

% Method 3: use averaged periodogram() --? unclear results
x1 = x(1:250);
x2 = x(251:500);
x3 = x(501:750);
x4 = x(751:1000);
pxx1 = periodogram(x1);
pxx2 = periodogram(x2);
pxx3 = periodogram(x3);
pxx4 = periodogram(x4);
pxx_average = (pxx1 + pxx2 + pxx3 + pxx4) / 4;
figure
plot(pxx_average)

% Method 4: pyulear()
pxx = pyulear(x,50);
figure
plot(pxx)
