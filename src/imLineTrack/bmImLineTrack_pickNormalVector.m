% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function N = bmImLineTrack_pickNormalVector(T)

T       = T(:)/norm(T(:)); 
frDim   = size(T, 1); 

[myMin, myInd] = min(abs(T)); 
N = zeros(size(T)); 
N(myInd, 1) = 1; 

if frDim == 1
    N = []; 
else 
    N = N - (N'*T)*T; 
    N = N(:)/norm(N(:));  
end

end