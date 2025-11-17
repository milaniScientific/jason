% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmInd_to_Jump(a)
    a = a(:).'; 
    b  = a - [0, a(1:end-1)]; 
end




