function [b,a] = pade_method(order, hd)

B = hd( 1:(2*order+1) )';

Aright = [eye(order+1) ; zeros(order, order+1) ];

% Let's initialize it first full of zeros
A = zeros(2*order+1, order);
for i=1:order
    % on column number i
    A(:,i) = [zeros(1,i)  ,  -hd(1:(2*order+1-i)) ]';
end
A = [A  Aright];

%Afirstcol =  [0 , -hd(1:4)]';
%Asecondcol = [0,0 , -hd(1:3)]';
%A = [Afirstcol Asecondcol Aright];

X = linsolve(A,B);
a = X(1:order);
b = X(   (order+1) : (2*order+1)   );