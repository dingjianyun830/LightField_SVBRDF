% compute the Average AA for smooth term
% the meanAA is the 4 neigborsaverage of the a4,a5,a6. 
function meanAA = ComputeAverageAA(AA,u,v)
meanAA = zeros(1,6);
for k = 4:6
    meanAA(k) = (AA(u-1,v,k) + AA(u,v-1,k) + AA(u,v+1,k) +AA(u,v-1,k))/4;
end