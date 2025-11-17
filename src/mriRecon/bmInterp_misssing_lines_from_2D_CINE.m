% 
% Bastien Milani
% Milani Scientific
% Martigny - Switzerland
% 
% y is the horizontal stack of lines and the time is the third dimension. 
% It must hold ndims(y) == 3. 
%
% m is a logical mask and must have the same size like y. It must be 'false'
% every where some data are missing. 
%
% Note that we interpolate only in the time direction. 

function z = bmInterp_misssing_lines_from_2D_CINE(y, m)

N       = size(y, 1); 
nLine   = size(y, 2); 
nFr     = size(y, 3); 

m = not(m); 

z = permute(y, [3, 1, 2]); 
z = reshape(z, [nFr, N*nLine]); 
z = cat(1, z, z(1, :)); 

m = permute(m, [3, 1, 2]); 
m = reshape(m, [nFr, N*nLine]); 
m = cat(1, m, m(1, :)); 

t_out   = (0:nFr)';

check_sum = (sum(m, 1) == 0);  

for i = 1:size(z, 2)
    
    if check_sum
       continue;  
    end
    
    temp_m          = m(:, i); 
    
    temp_t          = (0:nFr)';
    temp_t(temp_m)  = []; 
    
    temp_z          = z(:, i); 
    temp_z(temp_m)  = []; 
    
    z(:, i)         = interp1(temp_t, temp_z, t_out, 'linear');
    
end


z(end, :) = []; 
z = reshape(z, [nFr, N, nLine]); 
z = permute(z, [2, 3, 1]); 


end