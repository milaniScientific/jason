% Bastien Milani
% Milani Scientific
% Martigny - Switzerland


function coilSense = bmCoilSense_autocalib(x_main, ref_image, myMask, frSize)

nVox_tot                = prod(frSize(:)); 
nCh                     = bmColumnVecLength(x_main)/nVox_tot; 
x_main                  = bmFraChaReshape(x_main, nCh, frSize);
myMask                  = logical(bmFraChaReshape(myMask, 1, frSize));  
ref_image(not(myMask))  = 1;
x_main                  = single(x_main); 
coilSense               = single(bmComputeCoilSense( x_main, myMask, ref_image, nCh, frSize)); 

end






