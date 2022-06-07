function [b,a] = pronymet(order, hd)
% Cleju Nicolae

% Step 1: find coefficients a
%A = [27 , 22 ; 22 , 31]   % 2x2 matrix
for i=1:order
    for j=1:order
        %                      x   k   l   M
        A(i,j) = xcorr_prony( hd , i , j , order );
    end
    %                        x   k   l   M
    B(i,1) = - xcorr_prony( hd , i , 0 , order );
end
a = linsolve(A,B);   % solve

a = a';
for n = 0:order        % n is like in theory, starts from 0
   b(n+1) = hd(n+1) + sum(a(1:n) .* hd(n:-1:1));
end


end




function r = xcorr_prony(x, k, l, M)
% Computes restricted autocorrelation for the Prony method
% Inputs:
%  x = the input vector
%  k,l = the element to compute
%  M = the degree of the numerator polynomial B(z)
% Returns:
%  r = rxx[k,l] = rxx[k-l]

x(1 : M+1-max(k,l)) = 0; % Set first elements to 0
%x                        % Display the restricted x
rxx = xcorr(x);           % Compute the restricted autocorrelation vector

L = length(x);
r = rxx(L + (k-l));
end
