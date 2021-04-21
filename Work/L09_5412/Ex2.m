
clear all
close all

load mtlb;
plot(mtlb);

% Create the fixed point datatype: 1S2I5F
fp = fixdt(1,8,5);  % 1 for sign, 8 total, 5 fractionary
mtlb_r   = num2fixpt(mtlb, fp, [], 'Nearest');
mtlb_t   = num2fixpt(mtlb, fp, [], 'Floor');
mtlb_smt = num2fixpt(mtlb, fp, [], 'Zero');

e_r   = mtlb_r - mtlb;
e_t   = mtlb_t - mtlb;
e_smt = mtlb_smt - mtlb;

% Plot original and quantized signals
plot([mtlb , mtlb_r, mtlb_t, mtlb_smt])

% Plot quantization errors
figure
plot([e_r , e_t, e_smt])

% Error power (or energy)
P_r = sum( e_r.^2 ) / length(e_r);
P_t = sum( e_t.^2 ) / length(e_t);
P_smt = sum( e_smt.^2 ) / length(e_smt);

% Play
%sound(mtlb, Fs)
sound(mtlb_r, Fs)