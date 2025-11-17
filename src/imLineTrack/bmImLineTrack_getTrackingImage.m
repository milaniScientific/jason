% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function x = bmImLineTrack_getTrackingImage(x0, p_raw, ds, nPix)

[p, T, N, B] = bmImLineTrack_getTrackingFrame(p_raw, ds); 

nx = nPix; 
ny = nPix; 
nz = size(p, 2); 

lx = (-nx/2:nx/2-1)*ds; 
ly = (-ny/2:ny/2-1)*ds;

[lx, ly] = ndgrid(lx, ly); 

lx = lx(:)'; 
ly = ly(:)'; 

Nx = size(x0, 1); 
Ny = size(x0, 2); 
Nz = size(x0, 3); 

X0 = 1:Nx;
Y0 = 1:Ny;
Z0 = 1:Nz;

[X0, Y0, Z0] = ndgrid(X0, Y0, Z0); 

x = zeros(nx, ny, nz); 

for i = 1:nz

    p_rep   = repmat(p(:, i), [1, size(lx, 2)]); 
    G       = p_rep + N(:, i)*lx + B(:, i)*ly; 

    tempIm      = interpn(X0, Y0, Z0, x0, G(1, :), G(2, :), G(3, :)); 
    x(:, :, i)  = reshape(tempIm, [nx, ny]); 

end


end