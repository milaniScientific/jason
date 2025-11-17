function C = bmComputeCoilSense( a, argMask, ref_image, nCh, frSize)

frDim = size(frSize(:), 1);

C = complex(zeros([frSize, nCh]), zeros([frSize, nCh])); 
for c = 1:nCh
    if frDim == 1
        C(:, c) = bmComputeCoilSense1(a(:, c), argMask, ref_image);
    elseif frDim == 2
        C(:, :, c) = bmComputeCoilSense2(a(:, :, c), argMask, ref_image);
    elseif frDim == 3
        C(:, :, :, c) = bmComputeCoilSense3(a(:, :, :, c), argMask, ref_image);
    end
end
end