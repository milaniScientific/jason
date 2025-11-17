% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function ind_lin = bmTrajMask3D_to_linIndexList3D(argMask)

argMask = logical(squeeze(argMask)); 

s1 = size(argMask, 1); 
s2 = size(argMask, 2); 
s3 = size(argMask, 3); 

argMask = argMask(:); 

ind_1 = 1:s1; 
ind_2 = 1:s2;
ind_3 = 1:s3;

[ind_1, ind_2, ind_3] = ndgrid(ind_1, ind_2, ind_3); 

ind_1 = ind_1(:); 
ind_2 = ind_2(:);
ind_3 = ind_3(:);

ind_1 = ind_1(argMask); 
ind_2 = ind_2(argMask); 
ind_3 = ind_3(argMask); 

ind_lin = 1 + (ind_1 - 1) + s1*(ind_2 - 1) + s1*s2*(ind_3 - 1);

end