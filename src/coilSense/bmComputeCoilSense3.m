function b = bmComputeCoilSense3(a, argMask, ref_image)

b           = a./ref_image; 
b_real      = double(real(b));
b_imag      = double(imag(b)); 

b_real      = private_smooth_in_mask(b_real, argMask, 2); % --------------------------- magic_number
b_imag      = private_smooth_in_mask(b_imag, argMask, 2); % --------------------------- magic_number

b_real      = private_laplaceEqSolver(  b_real, argMask  );
b_imag      = private_laplaceEqSolver(  b_imag, argMask  );

b           = single(b_real + 1i*b_imag);

end





function s = private_laplaceEqSolver(x, m)

laplace_solver_numOfIter    = 1250;          % --------------------------------- magic_number
laplace_solver_thres        = 1.05e-4;       % --------------------------------- magic_number

frSize      = size(x); 
frDim       = size(frSize(:), 1); 

not_m       = not(logical(m)); 
x(not_m)    = 0; 


th_squared  = laplace_solver_thres^2; 
s           = x;
r           = th_squared + 1;


if frDim == 1

    h = [1, 1, 1].'/3;
    h_laplace = [1, -2, 1]; 

elseif frDim == 2

    h = [0, 1, 0; 1, 1, 1; 0, 1, 0]/5;
    h_laplace = [0, 1, 0; 1, -4, 1; 0, 1, 0];

elseif frDim == 3

    h1 = [0, 0, 0; 0, 1, 0; 0, 0, 0]; 
    h2 = [0, 1, 0; 1, 1, 1; 0, 1, 0]; 
    h3 = [0, 0, 0; 0, 1, 0; 0, 0, 0]; 
    h = cat(3, h1, h2, h3)/7;

    h1_laplace  = [0, 0, 0;  0, 1, 0;  0, 0, 0]; 
    h2_laplace  = [0, 1, 0;  1, -6, 1; 0, 1, 0]; 
    h3_laplace  = [0, 0, 0;  0, 1, 0;  0, 0, 0]; 
    h_laplace   = cat(3, h1_laplace, h2_laplace, h3_laplace);
    
end

while (r > th_squared)

    for i = 1:laplace_solver_numOfIter

        s = imfilter(s, h, 'Circular', 'Conv');
        s = s.*(1-m) + x.*m; 
        
    end
    
    s_laplace   = imfilter(s, h_laplace, 'Circular', 'Conv');
    r           = sum(  abs(s_laplace(not_m(:))).^2  )/sum(  abs(s(not_m(:))).^2  );


end

end


function b = private_smooth_in_mask(a, m, nIter)

frSize = size(a); 
frDim = size(frSize, 2); 

m = double(logical(m)); 
a = double(a); 

b = m.*a; 
c = (1-m).*a; 

if frDim == 1
    h = [1, 1, 1]; 
elseif frDim == 2
    h = [0, 1, 0; 1, 1, 1; 0, 1, 0]; 
elseif frDim == 3
    h1  = [0, 0, 0; 0, 1, 0; 0, 0, 0]; 
    h2  = [0, 1, 0; 1, 1, 1; 0, 1, 0]; 
    h3  = [0, 0, 0; 0, 1, 0; 0, 0, 0]; 
    h   = cat(3, h1, h2, h3); 
end
hm  = imfilter(m, h, 'Circular', 'Conv');
hm(not(logical(m))) = 1; 


for i = 1:nIter
    b = imfilter(b, h, 'Circular', 'Conv')./hm;
    b = b.*m; 
end

b = b.*m + c.*(1-m); 

end



