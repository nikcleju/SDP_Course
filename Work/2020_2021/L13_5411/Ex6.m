clear all
close all

% Exercise 6, Lab 12
[x, Fs] = audioread('music.wav');
x = x(:,1);

n = 0.03 * Fs;       % 0.03 = 30 mili
y = buffer(x, n);

for i = 1:size(y,2)   % iterate over columns of y
    [pxx, f] = periodogram( y(:,i) , [], [], Fs);  % spectrum of i-th segment
    %plot(f(1:100), pxx(1:100))    % plot pxx, but use the values in f on the horiz axis
    plot(f, pxx)    % plot pxx, but use the values in f on the horiz axis
    ylim([0 1e-4])  % fix vertical axis to range [0 -> 0.0001]
    pause(0.03)    % wait 30 ms before plotting the next spectrum
end

    



%sound(x, Fs)
%[pxx, f] = periodogram(x, [], [], Fs);
%plot(f, pxx)  % plot pxx, but use the values in f on the horiz axis

