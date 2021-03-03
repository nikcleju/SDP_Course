h = impz([1, -1.7, 0.7] , [1, 1.3, 0.4]);
plot(h)

[b,a] = pade_method(2, h');