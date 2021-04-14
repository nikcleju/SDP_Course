% Calculate the transfer function and plot its absolute value
H = freqz(b,a);
plot(abs(H))

% Quantize on 15 fractionary bits
Hq1 = qfr('c', 15, b, a, 512, [0 pi])
plot([ abs(H) , abs(Hq1) ])
