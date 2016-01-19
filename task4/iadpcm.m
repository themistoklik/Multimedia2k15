%function to inverse adpcm encoding
%input: quantized weights and residuals, quantization parameters, uniform quantization parameters
%output: decoded samples


function xd = iadpcm(rq,wq,L,wmin,wmax,n)
% Initializations
m = length(wq);
N = length(rq);

%% Recover residuals and prediction coefficients
[~, wL] = quantLevels(n, wmin, wmax);
w = arrayfun(@(sample) iQuant(sample, wL), wq);
r = arrayfun(@(sample) iQuant(sample, L), rq);

%% Reverse the dpcm process
xd = zeros(size(r));
xd(1:m) = r(1:m); %first samples are not decorrelated

%calculate predictions and add received residual to reconstruct sample
for i=m+1:N,
    pred = w' * xd(i-1:-1:i-m);
    xd(i) = pred + r(i);
end
xd = xd';
