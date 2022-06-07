function H = fr(b,a,K,theta);

% Frequency response of b(z)/a(z) on a given frequency interval.
% Input parameters:
% b, a: numerator and denominator polynomials
% K: the number of frequency response points to compute
% theta: if absent, the K points are uniformly spaced on [0, 2*pi];
%        if present and theta is a 1-by-2 vector, its entries are
%        taken as the end points (in radians!)of the interval on which K evenly
%        spaced points are placed; 
% Output:
% H: the frequency response vector.

if (nargin == 3),
   H = fft(b,K)./fft(a,K); 
   H1=20*log10(abs(H)); 
   %c=[0.005:0.005:0.5];
   %plot (c,H1)
elseif (length(theta) == 2),
   t0 = theta(1); dt = (theta(2)-theta(1))/(K-1);
   H = chirpf(b,t0,dt,K)./chirpf(a,t0,dt,K);
   H2=20*log10(abs(H)); 
   %c=[0.005:0.005:0.5];
   %plot (c,H2)
else
   disp ('wrong input arguments')   
end
