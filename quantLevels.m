function [D, L] = quantLevels(n, xmin, xmax)

% k = 2^n;
% L = xmin:(xmax-xmin)/(k-1):xmax;
% D = zeros(1, k-1);
% for i=1:k-1,
%     D(i) = (L(i)+L(i+1))/2;
% end

k = 2^n;
step = (xmax-xmin)/k;
D = xmin:step:xmax;
L = zeros(1, k);
for i=1:k,
    L(i) = (D(i)+D(i+1))/2;
end
D = D(2:end-1);

% D = zeros(1, k-1);
% L = zeros(1, k);