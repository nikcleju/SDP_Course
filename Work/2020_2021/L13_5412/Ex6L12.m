clear all
close all

% Exercise 6 from L12
[x,Fs] = audioread('music.wav');
x = x(:,1);  % keep one channel only

n = 0.09 * Fs;
y = buffer(x,n);

%sound(x, Fs)  % Listen to the sound signal

for i= 1:size(y,2)
   [pxx,f] = periodogram( y(:,i) ,[],[],Fs);
   plot(f(1:200),pxx(1:200))
   ylim([0 1e-4])  % Fix vertical axis scale from 0 to 1e-4
   pause(0.090)
end