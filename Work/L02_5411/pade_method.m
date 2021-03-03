function [b,a] = pade_method(order, hd)
% Nicolae Cleju
L = 2*order+1;
B = hd(1:L)';  % first 2*order+1 elements of hd

Aright = [eye(order+1) ; zeros(order,order+1)];

for i=1:order % first columns
    % column number i
    A(:,i) = [zeros(1,i) , -hd(1:L-i)]'  ;
end
A = [A  Aright];   
%Afirstcol  = [0  ,  -hd(1:4)]';
%Asecondcol = [0,0 ,  -hd(1:3)]';
%A = [Afirstcol   Asecondcol  Aright];

X = linsolve(A,B);
a = X(1:order);
b = X(order+1 : L);