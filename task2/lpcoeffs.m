% Linear prediction using LMS algorithm
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

mu = 0.01; %set learning rate to something small so we avoid divergence 
%make predictions for samples m:N
for i=m:N,
    u = x(i:-1:i-m+1);
    y(i) = w' * u;
    e(i) = d(i) - y(i);
    w = w + mu*u*e(i);
end
