% Bastien Milani
% Milani Scientific
% Martigny - Switzerland

function myTraj = bmTraj_fullRadial2_goldenAngle_lineAssym2(N, nLine, dK_n)

phi_gold = (3 - sqrt(5))*pi; 

phi         = zeros(1, nLine); 
phi(1, 1)   = 0;
for i = 2:nLine
   phi(1, i) = phi(1, i-1) + phi_gold;  
end

if mod(N, 2)
    % N odd
    r = -fix(N/2):fix(N/2);
else
    % N even
    r = -fix(N/2):fix(N/2)-1;
end
r     = r*dK_n; 


myTraj    = zeros(N, nLine, 2);

myTraj(:,:,1) = r'*cos(phi);
myTraj(:,:,2) = r'*sin(phi);

myTraj = reshape(myTraj, [N*nLine, 2]);
myTraj = myTraj';

end