% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmColChaReshape(a, nCh, frSize)

if ~iscell(a)
    b = bmColChaReshape_array(a, nCh, frSize);
else
    b = cell(size(a));
    for c = 1:bmColumnVecLength(a)
        b{c} = bmColChaReshape_array(a{c}, nCh, frSize);
    end
end

end