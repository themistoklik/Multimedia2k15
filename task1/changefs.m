function y = changefs(x, fs1, fs2)
M = floor(fs2/fs1*(length(x)-1));
%M = floor(fs2/fs1*(length(x))); %COMMENT OUT FOR COMPATIBILITY

N = length(x);
y = zeros(1, M);

y(1) = x(1);
for i=2:M-1
    
    srcCoord= (i-0.5)*N/M +1; % because MATLAB

    dist = srcCoord - floor(srcCoord);
    
    if dist < 0.5, %"left" side of cell
        next = floor(srcCoord);
        prev = max(next - 1, 1); %max for edge case of cell 0
    elseif dist == 0.5, %"center" of cell
        next = floor(srcCoord);
        prev = floor(srcCoord);
    else, %"right" side of cell
        prev = floor(srcCoord);
        next = min(prev + 1, N); %bug?
    end 
    
    %fprintf('y(%d) left: %d right: %d (dist=%f from %f)\n', i, prev, next, dist, srcCoord);
    
    y(i) = ...
        (1 - dist)*x(prev) + dist*x(next);
    
end
%fprintf('y(%d) left: %d right: %d\n', M, N, N);
y(M) = x(N);
    