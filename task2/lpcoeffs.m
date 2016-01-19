% Linear prediction using NLMS algorithm
% input: signal and desired order of prediction
% output: weights of order-m predictor

function w = lpcoeffs(x, m)
N = length(x);

d = [0; x(1:end-1)]; %desired signal: delayed by 1

%input too small? return
if N <= m,
    w = 0;
    return;
end

%% Simple LMS
y = zeros(N, 1); %filter output at N
e = zeros(N, 1); %error
w = zeros(m, 1); %initialize weights

alpha = 0.01;
mi = 1; %Normalized LMS requires mi < 1 for guaranteed fast convergence
%make predictions for samples m:N
for i=m:N,
    u = x(i:-1:i-m+1);
    y(i) = w' * u;
    e(i) = d(i) - y(i);
    mu = mi/(alpha+norm(u)^2); %update learning rate of NLMS
    w = w + mu*u*e(i);
end
