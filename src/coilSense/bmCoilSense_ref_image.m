% Bastien Milani
% Milani Scientific
% Martigny - Switzerland



function ref_image = bmCoilSense_ref_image(image_in, frSize, ref_image_thres)
  
numOfChannels = bmColumnVecLength(image_in)/prod(frSize(:)); 
image_in = bmColChaReshape(image_in, numOfChannels, frSize); 
if isempty(ref_image_thres)
    ref_image_thres       = mean(max(abs(image_in)))/3.8; % ------------------ magic_number
end
ref_image = abs(image_in); 
ref_image( ref_image > ref_image_thres) = ref_image_thres; 
ref_image = mean(ref_image, 2); 
ref_image = bmFraChaReshape(ref_image, 1, frSize); 

end