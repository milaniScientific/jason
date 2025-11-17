% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmChannelLast_to_channelFirst_array(a, nCh, frSize)

a_size = size(a); 
b_size = circshift(a_size, [0, 1]); 

a = reshape(a, [prod(frSize(:)), nCh]);
b = a.'; 
b = reshape(b, b_size); 

end