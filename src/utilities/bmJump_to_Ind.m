% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function b = bmJump_to_Ind(a)
    a = a(:).'; 
    b = cumsum(a); 
end




