% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function B = bmImLineTrack_getBinormalVector(T, N)

B = []; 

frDim = size(T, 1); 
if frDim < 3
    B = []; 
    return; 
end


B = zeros(size(T)); 
for i = 1:size(T, 2)
    B(:, i) = cross(T(:, i), N(:, i)); 
end

end