% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function t = bmLinIndexList2D_to_traj3D(linIndList, grSize, grStep)

linIndList  = linIndList(:);
nPt_yz      = size(linIndList, 1); 
nPt_x       = grSize(1, 1); 

t_yz = bmInd_to_multInd(linIndList.', grSize(1, 2:3)).';   


t_y = t_yz(:, 1) - 1 - grSize(1, 2)/2; 
t_z = t_yz(:, 2) - 1 - grSize(1, 3)/2; 

t_y = t_y*grStep(1, 2); 
t_z = t_z*grStep(1, 3); 

t_y = t_y(:).'; 
t_z = t_z(:).'; 

t_x = (-grSize(1, 1)/2:grSize(1, 1)/2-1)*grStep(1, 1);
t_x = t_x(:); 


t_x = repmat(t_x, [1, nPt_yz]);
t_y = repmat(t_y, [nPt_x, 1]); 
t_z = repmat(t_z, [nPt_x, 1]); 

t   = cat(1, t_x(:).', t_y(:).', t_z(:).'); 

end

