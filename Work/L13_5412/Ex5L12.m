clear all
close all

% Exercise 5 from L12
[x,Fs] = audioread('1st_String_E.ogg'); % Musical note E (Mi)
%[x,Fs] = audioread('2nd_String_B.ogg');
%[x,Fs] = audioread('6th_String_E.ogg'); % Musical note E (Mi)
%sound(x, Fs)

% Plot spectrum of complete signal
[pxx,f] = periodogram(x,[],[],Fs);
plot(f,pxx)

