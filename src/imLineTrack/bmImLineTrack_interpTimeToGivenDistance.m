% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function t = bmImLineTrack_interpTimeToGivenDistance(t_in, s_in, s)

nTime       = size(t_in, 2); 
nDist       = size(s, 2);

s_rep       = repmat(s(:),      [1, nTime]); 
s_in        = repmat(s_in(:).', [nDist, 1]); 

mySignum    = ((s_rep - s_in) >= 0);
myJump      = abs(mySignum(:, 2:end) - mySignum(:, 1:end-1)); 
indexMask   = logical(cat(2, myJump, zeros(nDist, 1))); 

indexTable  = repmat(1:nTime, [nDist, 1]); 
indexTable  = indexTable(:); 
indexList   = indexTable(indexMask(:)).';

t1  = t_in(1, indexList); 
t2  = t_in(1, indexList + 1); 

s1  = s_in(1, indexList); 
s2  = s_in(1, indexList + 1); 

t   = t1 + ((t2 - t1)./(s2 - s1)).*(s - s1); 

end