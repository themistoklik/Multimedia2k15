function [D, L] = quantLevels(n, xmin, xmax)


k = 2^n;
step = (xmax-xmin)/k;
D = xmin:step:xmax;
L = zeros(1, k);
for i=1:k,
    L(i) = (D(i)+D(i+1))/2;
end
D = D(2:end-1);
