% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function [b, m] = bmEmptyNonZero(a)

    m = not(a == 0); 
    b(m) = []; 

end