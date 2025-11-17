% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function b = bmChannelFirst_to_channelLast(a, nCh, frSize)

if ~iscell(a)
    b = bmChannelFirst_to_channelLast_array(a, nCh, frSize); 
else
    for c = 1:bmColumnVecLength(a)
        b{c} = bmChannelFirst_to_channelLast_array(a{c}, nCh, frSize);
    end
end

end