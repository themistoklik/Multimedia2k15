function q = Quant(x, D)
q = -inf;
k = length(D);
D = [-inf D inf];
for i=2:k+2,
    if x > D(i-1) && x <= D(i),
        q = i-1;
        break
    end
end