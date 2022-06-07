function y=filter_stsp(b , a, x, v)

ord=length(b)-1;

for i=1:ord

g(i)=b(ord+2-i)-b(1)*a(ord+2-i);

end

d=b(1);

F=[zeros(ord-1,1), eye(ord-1)];

F=[F ; -flip(a(2:end))];

q=[zeros(ord-1,1);1];

v=zeros(ord,1);

for n=1:length(x)

y(n)=g*v + d*x(n);

v= F*v+ q*x(n);

end

end