function aq = cuant(a,qtype,B)
%Quantize the scalar or vector `a` on `B` bits, 
%  using the quantization method indicated by `qtype`
%   INPUT:
%     a     = the value to quantize
%     qtype = quantization method:  't' = truncation
%                                   'r' = rounding,
%                                   'm' = sign-magnitude truncation;
%     B     = number of bits used for quantization
%   OUTPUT:
%     aq = the quantized value of a
%
% Internal method used: a is multiplied with 2^B, then it is 
%  quantized as an integer value, then it is scaled back by dividing to 2^B
% *********************************************************

% s=scale2(a);
% scn=2^(B)/s;
% aq=a*2^(B)/s;

scn=2^(B);
aq=a*2^(B);

if (qtype=='t'),
   aq=1/scn*floor(aq);
elseif (qtype=='r'),
   aq=1/scn*round(aq);
elseif (qtype=='m'),
   aq=1/scn*(sign(aq).*floor(abs(aq)));
else
   error('Unrecognized ''qtype'' paramater; please specify ''t'', ''r'', or ''m''')
end

