n  = 0:10;
hd = (1/3).^n  .*  cos(n*pi/4);

B = hd(1:5)';  % first five elements of hd

Aright = [eye(3) ; zeros(2,3)];
Afirstcol  = [0  ,  -hd(1:4)]';
Asecondcol = [0,0 ,  -hd(1:3)]';
A = [Afirstcol   Asecondcol  Aright];

X = linsolve(A,B);