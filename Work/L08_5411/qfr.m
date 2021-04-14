function H = qfr(typ,B,b,a,K,theta)

% Computes the frequency response of a filter subject
% to coefficient quantization.
% Input parameters:
% typ: 'd' for direct, 'p' for parallel, 'c' for cascade (series)
% B: number of bits for cuantization
% b, a: numerator and denominator polynomials
% K: number of frequency points
% theta: frequency interval (2-element vector), in radians.
% Output parameters:
% H: the quantized frequency response.

if (typ == 'd'),
   scn = (2^(B-1))/scale2(b); b = (1/scn)*round(scn*b); %scaled numerator polynomial
   scd = (2^(B-1))/scale2(a); a = (1/scd)*round(scd*a); %scaled denominator polynomial
   H = fr(b,a,K,theta);
   H1=20*log10(abs(H)); 
   c=[0:0.5/K:0.5-0.5/K];
   plot (c,H1)
elseif (typ == 'p'),
   [c,nsec,dsec] = rpfd(b,a);
   sc = (2^(B-1))/scale2(c); c = (1/sc)*round(sc*c);
   [M,junk] = size(nsec); H = fr(c,1,K,theta);
   for k = 1:M,
      nt = nsec(k,:); dt = dsec(k,:);
      if (dt(3) == 0), dt = dt(1:2); nt = nt(1); end%real poles
      scn = (2^(B-1))/scale2(nt); nt = (1/scn)*round(scn*nt);
      scd = (2^(B-1))/scale2(dt); dt = (1/scd)*round(scd*dt);
      H = H + fr(nt,dt,K,theta);
   H2=20*log10(abs(H)); 
   c=[0:0.5/K:0.5-0.5/K];
   plot (c,H2)
   endfor
elseif (typ == 'c'),
   if a==1,%FIR filter
      sec=[]; c=b(1); alpha=cplxpair(roots(b));
      while (length(alpha)>0),
			  if (imag(alpha(1)) ~= 0),%complex zeros
			     sec = [sec; [1,-2*real(alpha(1)),abs(alpha(1))^2]];
   			  alpha(1:2) = []; 
 			  else,%real poles
              sec = [sec; [1,-alpha(1),0]];
              alpha(1) = [];
           end
        end
       sc = (2^(B-1))/scale2(c); c = (1/sc)*round(sc*c);
		 [M,junk] = size(sec); H = c;
			for k = 1:M,
        		 t = sec(k,:);
					 if (t(3) == 0), t = t(1:2); end
				 sc = (2^(B-1))/scale2(t); t = (1/sc)*round(sc*t);
             H = H.*fr(t,a,K,theta);
             H3=20*log10(abs(H)); 
             c=[0:0.5/K:0.5-0.5/K];
             plot (c,H3)
         end
    else, %IIR filter   
   c = b(1); v = roots(a); u = roots(b);
   [nsec,dsec] = pairpz(v,u);
   sc = (2^(B-1))/scale2(c); c = (1/sc)*round(sc*c);
   [M,junk] = size(nsec); H = c;
   	for k = 1:M,
      	nt = nsec(k,:); dt = dsec(k,:);
      		if (dt(3) == 0), dt = dt(1:2); nt = nt(1:2); end
      	scn = (2^(B-1))/scale2(nt); nt = (1/scn)*round(scn*nt);
      	scd = (2^(B-1))/scale2(dt); dt = (1/scd)*round(scd*dt);
         H = H.*fr(nt,dt,K,theta);
         H4=20*log10(abs(H)); 
         c=[0:0.5/K:0.5-0.5/K];
         plot (c,H4)
      endfor
   end   
end

