function [nsec,dsec] = pairpz(v,u);
% Pole-zero pairing for cascade realization.
% Input parameters:
% v, u: the vectors of poles and zeros, respectively.
% Output parameters:
% nsec: matrix of numerator coefficients of 2nd-order sections
% dsec: matrix of denom. coefficients of 2nd-order sections.

if (length(v) ~= length(u)),
  error('Different numbers of poles and zeros in PAIRPZ'); end
u = reshape(u,1,length(u)); v = reshape(v,1,length(v));
v = cplxpair(v); u = cplxpair(u); 
vc = v(find(imag(v) > 0)); uc = u(find(imag(u) > 0));%complex values
vr = v(find(imag(v) == 0)); ur = u(find(imag(u) == 0));%real values 
[temp,ind] = sort(abs(vc)); vc = vc(fliplr(ind));%vc=complex poles in decreasing order
[temp,ind] = sort(abs(vr)); vr = vr(fliplr(ind));%vr=real poles in decreasing order
nsec = []; dsec = [];
for n = 1:length(vc),
   dsec = [dsec; [1,-2*real(vc(n)),abs(vc(n))^2]];
   if (length(uc) > 0),
      [temp,ind] = min(abs(vc(n)-uc)); ind = ind(1);
      nsec = [nsec; [1,-2*real(uc(ind)),abs(uc(ind))^2]];
      uc(ind) = [];
   else,%no more complex zeros 
      [temp,ind] = min(abs(vc(n)-ur)); ind = ind(1);
      tempsec = [1,-ur(ind)]; ur(ind) = [];
      [temp,ind] = min(abs(vc(n)-ur)); ind = ind(1);
      tempsec = conv(tempsec,[1,-ur(ind)]); ur(ind) = [];
      nsec = [nsec; tempsec];
   end
end
if (length(vr) == 0), return
elseif (length(vr) == 1),%one real pole
   dsec = [dsec; [1,-vr,0]]; nsec = [nsec; [1,-ur,0]];
elseif (length(vr) == 2),
   dsec = [dsec; [1,-vr(1)-vr(2),vr(1)*vr(2)]];
   nsec = [nsec; [1,-ur(1)-ur(2),ur(1)*ur(2)]];
else
   error('Something wrong in PAIRPZ, more than 2 real poles');
end

