[y, Fs] = audioread('Sample.wav');

y = y( 1:(Fs*5), 1);

%stem
plot( y(1:50) )

output = filter( [1, 1, 1] , 1 , y);
plot( [y, output] )

%sound()
obj = audioplayer(output, Fs);
play(obj);
