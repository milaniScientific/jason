% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function T = bmImLineTrack_getVelocityVector(p, t)

nPt     = size(p, 2); 
frDim   = size(p, 1); 

T = zeros(frDim, nPt); 

T(:, 1)     = ( p(:, 2) - p(:, 1) )/(t(1, 2) - t(1, 1));  
T(:, end)   = ( p(:, end) - p(:, end-1) )/(t(1, end) - t(1, end-1));

dT = p(:, 3:end) - p(:, 1:end-2);
dt = t(1, 3:end) - t(1, 1:end-2); 
dt = repmat(dt, [frDim, 1]); 
T(:, 2:end-1) = dT./dt; 

end