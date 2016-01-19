%adpcm encoding function
%input: signal,quantization parameters, order of predictor, uniform quantization parameters
%output: quantized residuals, quantized weights of predictor

function [rq, wq] = adpcm(x, D, L, m, wmin, wmax, n)
x = x';
%% Prepare coding system
%Compute m-degree w for x
w = lpcoeffs(x, m);

%Compute quantization parameters for W
[wD, wL] = quantLevels(n, wmin, wmax);


%% Mimic decoder quantization noise
%for signal
xr = arrayfun(@(sample) iQuant(Quant(sample, D), L), x);

%for predictor coefficients
wq = arrayfun(@(sample) iQuant(Quant(sample, wD), wL), w);

%% Decorrelate signal by predicting its values
rq = zeros(size(x));
rq(1:m) = xr(1:m);
% Calculate prediction values and residuals.
for i=m+1:length(x),
    prediction = wq'*xr(i-1:-1:i-m);
    rq(i) = xr(i) - prediction;
end

%% Quantize residuals and w
rq = arrayfun(@(sample) Quant(sample, D), rq);
wq = arrayfun(@(sample) Quant(sample, wD), wq);
