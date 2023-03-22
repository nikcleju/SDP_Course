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
ord = ...     % deduce the filter order

F = ...       % parameters from the equations
g = ...
q = ...
d = ...

v = ...       % initial state vector = a column of `ord x 1` zeros 
    
for n=1: ...
    y(n) = ...      % output equation
    v = ...         % state equation: new v = ... based on old v

end

end
