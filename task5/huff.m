function b = huff(q, s)
%function huff(q, s) assigns in b{q(i)} the symbol

N = length(q); %number of characters to encode
b = cell(size(q));
for i = 1:N,
    %simply assign the right symbol
    b{i} = s{q(i)};
end
b = [b{:}]; %new
return
