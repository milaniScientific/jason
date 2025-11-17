% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmChaRowReshape_array(a, nCh, frSize)
    b = reshape(a, [nCh, prod(frSize(:))]);
end