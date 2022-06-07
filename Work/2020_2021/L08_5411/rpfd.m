function [c,nsec,dsec] = rpfd(b,a)

%  Real partial fraction decomposition of b(z)/a(z). The polynomials are in
% negative powers of z. The poles are assumed distinct.
% Input parameters:
% a, b: the input polynomials
% Output parameters:
% c: the free polynomial; empty if deg(b) < deg(a)
% A: the vector of gains of the partial fractions
% alpha: the vector of poles
% nsec: matrix of numerator coefficients
% dsec: matrix of denominator coefficients.

% Compute c(z) and d(z)
p = length(a)-1; q = length(b)-1;
a = (1/a(1))*reshape(a,1,p+1);
b = (1/a(1))*reshape(b,1,q+1);
if (q >= p), % case of nonempty c(z)
   temp = toeplitz([a,zeros(1,q-p)],[a(1),zeros(1,q-p)]);
   temp = [temp,[eye(p); zeros(q-p+1,p)]];
   temp = temp\b';
   c = temp(1:q-p+1)'; d = temp(q-p+2:q+1)';
else
   c = []; d = [b,zeros(1,p-q-1)];
end
% Compute A and alpha
alpha = cplxpair(roots(a)); A = zeros(1,p);
for k = 1:p,
   temp = prod(alpha(k)-alpha(find(1:p ~= k)));
   if (temp == 0), error('Repeated roots in TF2PF');
   else, A(k) = polyval(d,alpha(k))/temp; 
   end
end
% Compute real numerator and real denominator of partial fractions
nsec = []; dsec = []; 
while (length(alpha) > 0),
  if (imag(alpha(1)) ~= 0),%complex poles
     nsec = [nsec; [2*real(A(1)),-2*real(A(1)*conj(alpha(1)))]];
     dsec = [dsec; [1,-2*real(alpha(1)),abs(alpha(1))^2]];
    alpha(1:2) = []; A(1:2) = [];
  else,%real poles
     nsec = [nsec; [real(A(1)),0]];
     dsec = [dsec; [1,-alpha(1),0]];
    alpha(1) = []; A(1) = [];
  end
   
end
