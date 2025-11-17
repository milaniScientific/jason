% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function L = bmImLineTrack_getLengthList(p)

    nPt     = size(p, 2); 
    frDim   = size(p, 1); 
    dp      = p(:, 2:end) - p(:, 1:end-1); 

    if frDim == 1
        d = abs(dp);
    elseif frDim == 2
        d = sqrt(  dp(1, :).^2 + dp(2, :).^2  ); 
    elseif frDim == 3
        d = sqrt(  dp(1, :).^2 + dp(2, :).^2 + dp(3, :).^2  ); 
    end
    d = cat(2, 0, d); 
    
    L = zeros(1, nPt); 
    L_sum = 0; 
    for i = 1:nPt
        L_sum = L_sum + d(1, i); 
        L(1, i) = L_sum; 
    end

end