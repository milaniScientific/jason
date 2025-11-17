% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function [b, m] = bmEmptyZero(a)

    m = (a == 0); 
    b(m) = []; 

end