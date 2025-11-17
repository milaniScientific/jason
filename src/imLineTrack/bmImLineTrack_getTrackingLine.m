% Bastien Milani
% Milani Scientific Consulting
% 2025 Martigny


function [p_fine, t_fine] = bmImLineTrack_getTrackingLine(p_raw, ds)

nPt_raw     = size(p_raw, 2);
t_raw       = linspace(0, 1, nPt_raw);

nPt_fine    = 2*nPt_raw;
t_fine      = linspace(0, 1, nPt_fine);
p_fine      = bmImLineTrack_interpCurve(t_raw, p_raw, t_fine); 



while bmImLineTrack_getMaxStepLength(p_fine) > ds/10 % ------------------------------ magic_number

    nPt_fine    = 2*nPt_fine;
    t_fine      = linspace(0, 1, nPt_fine);
    p_fine      = bmImLineTrack_interpCurve(t_raw, p_raw, t_fine); 

end


end