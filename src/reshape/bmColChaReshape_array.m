% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmColChaReshape_array(a, nCh, frSize)
    b = reshape(a, [prod(frSize(:)), nCh]);
end