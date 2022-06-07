n = 0:100; % n = [0,1,2,3,4]
hd = ((1/3).^n) .* cos(n*pi/4);

[b, a] = pronymet(3, hd)