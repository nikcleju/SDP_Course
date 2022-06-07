function y = filter_stsp(b, a, x, v)
% Filter a signal x with state-space type 1 equations
%  b, a = coefficients of the filter
%  x = input vector
%  v = initial conditions (initial value of the state vector)
%
% Returns y = the output vector, same size as x

ord = length(b) - 1;

% Compute vector g
for i=1:ord
    g(i) = b(ord+2-i) - b(1)*a(ord+2-i);
    % Check: for ord=3
    % i=1  => b(4)-b(1)*a(4)
    % i=2  => b(3)-b(1)*a(3)
    % i=3  => b(2)-b(1)*a(2)
end

d = b(1);
F = [ zeros(ord-1, 1) , eye(ord-1)];
F = [F ; -flip(a(2:end))];
q = [zeros(ord-1, 1) ; 1];

% State vector initialization
%v = zeros(ord, 1);

% For every time moment n
for n=1:length(x)
    y(n) = g*v + d*x(n);
   
    v = F*v + q*x(n);
end


end  % end of the function