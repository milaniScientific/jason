% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function ind_lin = bmTrajMask2D_to_linIndexList2D(argMask)

argMask = logical(squeeze(argMask)); 

s1 = size(argMask, 1); 
s2 = size(argMask, 2); 

argMask = argMask(:); 

ind_1 = 1:s1; 
ind_2 = 1:s2;

[ind_1, ind_2] = ndgrid(ind_1, ind_2); 

ind_1 = ind_1(:); 
ind_2 = ind_2(:);

ind_1 = ind_1(argMask); 
ind_2 = ind_2(argMask); 

ind_lin = 1 + (ind_1 - 1) + s1*(ind_2 - 1);

end