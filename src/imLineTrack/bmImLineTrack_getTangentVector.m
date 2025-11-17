% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function T = bmImLineTrack_getTangentVector(p, t)

nPt     = size(p, 2); 
frDim   = size(p, 1); 

T = zeros(frDim, nPt); 

T(:, 1)     = ( p(:, 2) - p(:, 1) )/(t(1, 2) - t(1, 1));  
T(:, end)   = ( p(:, end) - p(:, end-1) )/(t(1, end) - t(1, end-1));

dT = p(:, 3:end) - p(:, 1:end-2);
dt = t(1, 3:end) - t(1, 1:end-2); 
dt = repmat(dt, [frDim, 1]); 
T(:, 2:end-1) = dT./dt; 

if frDim == 1
    myNorm = abs(T); 

elseif frDim == 2
    myNorm = sqrt(  T(1, :).^2 + T(2, :).^2  ); 

elseif frDim == 3
    myNorm = sqrt(  T(1, :).^2 + T(2, :).^2 + T(3, :).^2  );

end

myNorm = repmat(myNorm, [frDim, 1]); 
T       = T./myNorm; 

end