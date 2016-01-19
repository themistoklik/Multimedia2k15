function [q, n] = ihuff(b, s)

%create a dictionary to solve the problem fast
values = {};
for i=1:length(s),
    values{i} = i;
end

%dict now contains a mapping of bitstring -> value
dict = containers.Map(s, values);

q = zeros(size(b));
last = 0;
for i=1:length(b),
    if dict.isKey(b{i}),
        char = dict(b{i});
        q(i) = char;
        last = last+1;
    else
        break;
    end
end
n = length(b) - last;
