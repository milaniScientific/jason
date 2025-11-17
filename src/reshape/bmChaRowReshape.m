% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmChaRowReshape(a, nCh, frSize)

if ~iscell(a)
    b = bmChaRowReshape_array(a, nCh, frSize);
else
    b = cell(size(a));
    for c = 1:bmColumnVecLength(a)
        b{c} = bmChaRowReshape_array(a{c}, nCh, frSize);
    end
end

end