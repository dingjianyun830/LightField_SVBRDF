% compute the Average AA for smooth term
% the meanAA is the 4 neigborsaverage of the a4,a5,a6. 
function meanAA = ComputeAverageAA(AA,u,v)
meanAA = zeros(1,6);
for k = 4:6
    n = 4;
    b1 = AA(u-1,v,k);b2 = AA(u,v-1,k);b3 = AA(u,v+1,k);b4 = AA(u,v-1,k);
    if b1 == -1
        b1=0;
        n=n-1;
    end
    if b2 == -1
        b2=0;
        n=n-1;
    end
    if b3 == -1
        b3=0;
        n = n-1;
    end
    if b4 == -1
        b4 = 0;
        n = n-1;
    end
    if n==0
        meanAA(k) = 0;
    else
        meanAA(k) = (b1+b2+b3+b4)/n;
    end
    %meanAA(k) = (AA(u-1,v,k) + AA(u,v-1,k) + AA(u,v+1,k) +AA(u,v-1,k))/4;
end