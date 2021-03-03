n = 0:4; % n = [0,1,2,3,4]
hd = ((1/3).^n) .* cos(n*pi/4);

B = hd';

Aright = [eye(3) ; zeros(2,3) ];
Afirstcol =  [0 , -hd(1:4)]';
Asecondcol = [0,0 , -hd(1:3)]';

A = [Afirstcol Asecondcol Aright];

X = linsolve(A,B);