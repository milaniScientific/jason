% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function N = bmImLineTrack_getNormalVector(T)

N = zeros(size(T)); 
N(:, 1) = bmImLineTrack_pickNormalVector(T(:, 1)); 

for i = 2:size(T, 2)
    
    temp_N  = N(:, i-1) - (N(:, i-1)'*T(:, i))*T(:, i); 
    N(:, i) = temp_N(:)/norm(temp_N(:)); 

end

end