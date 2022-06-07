% Nicolae Cleju
load mtlb;
plot(mtlb)

fp = fixdt(1,8,3); % 1 sign bit, 8 total, 5 for fractionary
mtlb_r   = num2fixpt(mtlb, fp, [], 'Nearest', 'off');
mtlb_t   = num2fixpt(mtlb, fp, [], 'Floor', 'off');
mtlb_smt = num2fixpt(mtlb, fp, [], 'Zero', 'off');

% Plot the signal and the quantized versions
plot([ mtlb, mtlb_r, mtlb_t, mtlb_smt])

% Quantization errors
e_r   = mtlb_r - mtlb;
e_t   = mtlb_t - mtlb;
e_smt = mtlb_smt - mtlb;
plot([ e_r, e_t, e_smt])

P_r   = sum(e_r.^2) / length(e_r);
P_t   = sum(e_t.^2) / length(e_t);
P_smt = sum(e_smt.^2) / length(e_smt);

% Play
%sound(mtlb, Fs)
sound(mtlb_t, Fs)