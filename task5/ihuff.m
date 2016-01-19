function [q, n] = ihuff(b, s)

%create a dictionary/hashmap to solve the problem fast
values = {};
for i=1:length(s),
    values{i} = i;
end

%dict now contains a mapping of bitstring -> value
dict = containers.Map(s, values);

q = zeros(size(b));
%variable to hold the last position of decoded bit in the "bitstream"
last = 0;
%for every item in the "bitstream" check if it's in our dictionary,
%and if it is, assign it the correct character.
for i=1:length(b),
    if dict.isKey(b{i}),
        char = dict(b{i});
        q(i) = char;
        last = last+1;
    else
        break;
    end
end
%the number of bits not decoded are (all of them - all that we decoded)
n = length(b) - last;

