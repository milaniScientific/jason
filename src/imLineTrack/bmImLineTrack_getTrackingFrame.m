% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function [p, T, N, B] = bmImLineTrack_getTrackingFrame(p_raw, ds) 

[p_fine, t_fine] = bmImLineTrack_getTrackingLine(p_raw, ds); 


s_fine  = bmImLineTrack_getLengthList(p_fine);
L       = bmImLineTrack_getTotalLength(p_fine); 
s       = 0:ds:L;

T_fine  = bmImLineTrack_getTangentVector(p_fine, t_fine); 
N_fine  = bmImLineTrack_getNormalVector(T_fine);
B_fine  = bmImLineTrack_getBinormalVector(T_fine, N_fine);

t       = bmImLineTrack_interpTimeToGivenDistance(t_fine, s_fine, s);
p       = bmImLineTrack_interpCurve(t_fine, p_fine, t);
T       = bmImLineTrack_interpCurve(t_fine, T_fine, t);
N       = bmImLineTrack_interpCurve(t_fine, N_fine, t);
B       = bmImLineTrack_interpCurve(t_fine, B_fine, t);


end