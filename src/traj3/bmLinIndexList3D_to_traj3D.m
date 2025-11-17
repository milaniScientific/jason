% Bastien Milani 
% Milani Scientific
% Martigny - 2025

function t = bmLinIndexList3D_to_traj3D(linIndList, grSize, grStep)

t = bmInd_to_mulInd(linIndList(:).', grSize).';   


t(:, 1) = t(:, 1) - 1 - grSize(1, 1)/2; 
t(:, 2) = t(:, 2) - 1 - grSize(1, 2)/2; 
t(:, 3) = t(:, 3) - 1 - grSize(1, 3)/2; 

t(:, 1) = t(:, 1)*grStep(1, 1); 
t(:, 2) = t(:, 2)*grStep(1, 2); 
t(:, 3) = t(:, 3)*grStep(1, 3); 

t = t.'; 

end