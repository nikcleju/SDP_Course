function r = xcorr_prony(x, k, l, M)
% Computes restricted autocorrelation for the Prony method
% Inputs:
%  x = the input vector
%  k,l = the element to compute
%  M = the degree of the numerator polynomial B(z)
% Returns:
%  r = rxx[k-l] (k-l is the index in theory)

x(1 : M+1-max(k,l)) = 0; % Set first elements to 0
% x                      % Display the restricted x
rxx = xcorr(x);           % Compute the restricted autocorrelation vector

L = length(x);
r = rxx(L + k-l);        % value at position L+k-l is the value which in theory we call rxx[k-l]
end
