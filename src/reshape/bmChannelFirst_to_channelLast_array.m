% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmChannelFirst_to_channelLast_array(a, nCh, frSize)

a_size = size(a); 
b_size = circshift(a_size, [0, -1]); 

a = reshape(a, [nCh, prod(frSize(:))]);
b = a.'; 
b = reshape(b, b_size); 

end