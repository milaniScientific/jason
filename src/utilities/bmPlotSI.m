% Bastien Milani
% Milani Scientific
% Martigny, Switzerland


function bmPlotSI(y)


mySI = squeeze(y(:, :, 1, :));
mySI = bmIDF(mySI, 1, [], 2);
mySI = squeeze(  sqrt(sum(abs(mySI).^2, 1))  ); 
mySI = mySI - min(mySI(:)); 
mySI = mySI/max(mySI(:)); 

mySize_1 = size(mySI, 1);
mySize_2 = size(mySI, 2);
x_SI = 1:mySize_1;
x_SI = repmat(x_SI(:), [1, mySize_2]);

s_mean = mean(x_SI.*mySI, 1);
s_center_mass = sum(x_SI.*mySI, 1)./sum(mySI, 1);



figure
hold on
imagesc(mySI); 
colormap gray
plot(s_center_mass, 'y.-')
plot(s_mean, 'r.-')
caxis([0, 3*mean(mySI(:))])



end