% Bastien Milani 
% Milani Scientific
% Martigny - 2025

function t = bmLinIndexList2D_to_traj2D(linIndList, grSize, grStep)

t = bmInd_to_multInd(linIndList(:).', grSize).';   


t(:, 1) = t(:, 1) - 1 - grSize(1, 1)/2; 
t(:, 2) = t(:, 2) - 1 - grSize(1, 2)/2; 

t(:, 1) = t(:, 1)*grStep(1, 1); 
t(:, 2) = t(:, 2)*grStep(1, 2); 

t = t.';

end