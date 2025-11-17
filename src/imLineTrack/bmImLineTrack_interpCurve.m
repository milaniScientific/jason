% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function p_out = bmImLineTrack_interpCurve(t_in, p_in, t_out)

if isempty(p_in)
    p_out = []; 
    return; 
end

frDim = size(p_in, 1);

if frDim == 1
    p_out       = interpn(t_in, p_in, t_out, 'makima');
elseif frDim == 2
    p_out_x     = interpn(t_in, p_in(1, :), t_out, 'makima');
    p_out_y     = interpn(t_in, p_in(2, :), t_out, 'makima');
    p_out       = cat(1, p_out_x, p_out_y);
elseif frDim == 3
    p_out_x     = interpn(t_in, p_in(1, :), t_out, 'makima');
    p_out_y     = interpn(t_in, p_in(2, :), t_out, 'makima');
    p_out_z     = interpn(t_in, p_in(3, :), t_out, 'makima');
    p_out       = cat(1, p_out_x, p_out_y, p_out_z);
end





end