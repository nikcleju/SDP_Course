n  = 0:100;
hd = (1/3).^n  .*  cos(n*pi/4);

[b,a] = pade_method(4, hd);