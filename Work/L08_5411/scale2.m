function s = scale2(a)

 % Finds a power-of-2 full scale for the vector a.

s =  2^(ceil(log(max(abs(a)))/log(2)));

