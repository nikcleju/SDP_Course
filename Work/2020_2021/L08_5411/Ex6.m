% Calculate the transfer function and plot its absolute value
H = freqz(b,a);
plot(abs(H))
%plot( 10*log(abs(H)) )

% Quantize on 15 fractionary bits
bq1 = cuant(b, 'r', 15);
aq1 = cuant(a, 'r', 15);
Hq1 = freqz(bq1,aq1);
plot([ abs(H) , abs(Hq1) ])

% Quantize on 10 fractionary bits
bq2 = cuant(b, 'r', 10);
aq2 = cuant(a, 'r', 10);
Hq2 = freqz(bq2,aq2);
plot([ abs(H) , abs(Hq1), abs(Hq2) ])

figure
zplane(b,a);
figure
zplane(bq1,aq1);
figure
zplane(bq2,aq2);