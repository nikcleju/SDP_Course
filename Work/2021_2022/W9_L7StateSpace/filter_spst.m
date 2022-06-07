% Rename this file to `filter_spst.m`

function y = filter_spst(b, a, x)
% Filter a signal with state-space equations type I
%
% Inputs:
%   b = vector of numerator coefficients
%   a = vector of denominator coefficients
%   x = input signal
% Outputs:
%   y = filtered signal

% Fill in:
ord = length(b)-1;     % deduce the filter order

F = [zeros(ord-1,1) , eye(ord-1) ; -a(end:-1:2)];       % parameters from the equations
g = [zeros(ord-1,1) ; 1 ];
% q = [b3 b2 b1] - b0*[a3 a2 a1]
q = b(end:-1:2) - b(1)*a(end:-1:2);
d = b(1);

v = zeros(ord,1);   % initial state vector = a column of `ord x 1` zeros 
    
for n=1:length(x)
    y(n) = q*v + d*x(n);  % output equation
    v    = F*v + g*x(n);  % state equation: new v = ... based on old v
end

end
