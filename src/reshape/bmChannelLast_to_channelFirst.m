% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmChannelLast_to_channelFirst(a, nCh, frSize)

if ~iscell(a)
    b = bmChannelLast_to_channelFirst_array(a, nCh, frSize); 
else
    b = cell(size(a)); 
    for c = 1:bmColumnVecLength(a)
        b{c} = bmChannelLast_to_channelFirst_array(a{c}, nCh, frSize);
    end
end

end