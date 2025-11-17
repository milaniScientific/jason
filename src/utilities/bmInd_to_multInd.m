function ind_out = bmInd_to_multInd(ind_in, array_size)

myCumProd   = cumprod(bmRowVec(array_size)); 
ind_curr    = bmRowVec(ind_in - 1);

ind_out     = zeros(  size(array_size, 2), size(ind_curr, 2)  ); 

for n = size(array_size, 2):-1:2

ind_out(n, :)   = fix(  ind_curr/myCumProd(1, n-1)  ); 
ind_curr        = ind_curr - ind_out(n, :).*myCumProd(1, n-1); 

end
ind_out(1, :) = ind_curr; 

ind_out = ind_out + 1; 

end