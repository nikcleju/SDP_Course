n  = 0:10;
hd = (1/3).^n  .*  cos(n*pi/4);

[b,a] = pronymet(1, hd)