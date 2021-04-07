% Nicolae Cleju
function y = filter_stsp(b, a, x, v_init, type)
% b, a = filter coefficients
% x = input signal
% v_init = initial value of state vector v
% type = 1 or 2, specifies which equations to use
%
% Returns y = the output signal


ord = length(b) - 1;

% Compute g vector with pattern bk - b0*ak
for i=1:ord
    g(i) = b(ord+2-i) - b(1)*a(ord+2-i);
    % Check: when ord=3:
    %  g(1) = b(4) - b(1)*a(4);
    %  g(2) = b(3) - b(1)*a(3);
    %  g(3) = b(2) - b(1)*a(2);
end
d = b(1);
F = [ zeros(ord-1, 1) , eye(ord-1)];
F = [F ; -flip( a(2:end) ) ];
q = [zeros(ord-1, 1) ; 1 ];
% If type == 2, then use type 2 equations
% Transpose F, swap q and g vectors
if type == 2
    F = F';
    aux = g;
    g = q';    % Keep in mind that g must be a row
    q = aux';  %  and q must be a column
end
% Initialize the state vector v
%v = zeros(ord, 1);
v = v_init;  % use the values received as argument
for n=1:length(x)
    y(n) = g*v + d*x(n);
    v = F*v + q*x(n);
end

end