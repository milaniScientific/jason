% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmFraChaReshape_array(a, nCh, frSize)
    b           = reshape(a, [frSize, nCh]); 
end