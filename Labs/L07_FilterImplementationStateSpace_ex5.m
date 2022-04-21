% Lab State-space implementation, ex 5

%1. Use `fdatool` to design an IIR low-pass filter and export the coefficients to Matlab

%2. Fill in below

% Use `audioread()` to load `Kalimba.mp3` (or any other file)
[x, Fs] = .. ;

% Keep only 5 seconds, first channel
x = x( .. );

% Filter the signal with `filter_spst()`
y = ..

% Listen to the filtered signal with `sound()`
..