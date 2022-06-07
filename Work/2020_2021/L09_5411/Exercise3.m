% Output signal with no quantization
x = mtlb;
y(1) = x(1);% assume y(0) = 0, initial condition
for n=2:length(x)
    y(n) = 0.5*y(n-1) + x(n);
end

% Output signal with quantization by rounding
x = mtlb_r;
yq(1) = x(1);% assume y(0) = 0, initial condition
for n=2:length(x)
    temp  = num2fixpt(0.5*yq(n-1), fp, [], 'Nearest');
    yq(n) = num2fixpt(temp + x(n), fp, [], 'Nearest');
end

plot([y', yq'])