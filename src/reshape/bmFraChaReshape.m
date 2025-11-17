% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function b = bmFraChaReshape(a, nCh, frSize)

if ~iscell(a)
    b = bmFraChaReshape_array(a, nCh, frSize); 
else
    b  = cell(size(a));
    for c = 1:bmColumnVecLength(a)
        b{c} = bmFraChaReshape_array(a{c}, nCh, frSize);
    end
end

end