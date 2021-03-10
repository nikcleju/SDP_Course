function [b,a] = pronymet(order, hd)

% Step 1: Find a coefficients
for i=1:order
    for j=1:order
        % at element (i,j)
        A(i,j) = xcorr_prony( hd , i , j , order);
    end
end

for i=1:order
    B(i,1) = - xcorr_prony( hd , i , 0 , order);

end

a = linsolve(A,B);

% Step 2: Find b coefficients
a = a';
for n=0:order
    b(n+1) = hd(n+1) + sum(a(1:n) .* hd(n:-1:1));
end

end