clear all
close all

% Nicolae Cleju

% Exercise 5, Lab12
%[x, Fs] = audioread('1st_String_E.ogg');
%[x, Fs] = audioread('2nd_String_B.ogg');
[x, Fs] = audioread('6th_String_E.ogg');
sound(x, Fs)
[pxx, f] = periodogram(x, [], [], Fs);
plot(f, pxx)  % plot pxx, but use the values in f on the horiz axis
