% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function L = bmImLineTrack_getTotalLength(p)

    frDim = size(p, 1); 
    dp = p(:, 2:end) - p(:, 1:end-1); 

    if frDim == 1
        d = abs(dp);
    elseif frDim == 2
        d = sqrt(  dp(1, :).^2 + dp(2, :).^2  ); 
    elseif frDim == 3
        d = sqrt(  dp(1, :).^2 + dp(2, :).^2 + dp(3, :).^2  ); 
    end
    L = sum(d(:)); 

end