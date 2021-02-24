[y, Fs] = audioread('Sample.wav');

yshort = y( 1:(Fs*5) , 1 );

plot(yshort)

yout = filter( [1,1,1], 1 , yshort );

figure
plot( [yshort, yout] )

%obj = audioplayer(yshort, Fs);  % original signal
obj = audioplayer(yout, Fs);    % filtered signal
play(obj);

