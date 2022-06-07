n = 0:1000; % n = [0,1,2,3,4]
hd = ((1/3).^n) .* cos(n*pi/4);

[b,a] = pade_method(5, hd);



