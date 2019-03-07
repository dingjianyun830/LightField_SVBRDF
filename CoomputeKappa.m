%% Construct the Kappa Array
% This function is used to construct the Kappa array.
% INPUT:
%      -- HH            , a known half angle matrix
%      -- Gamma         , gamma array
%      -- f             , the focal length of the camera
%      -- F             , the finite the focused distance
%      -- Iu            , the horizental direction of spatial derivatives
%      -- Iv            , the vertical direction of spatial derivatives
% OUTPUT:
%      -- Kappa  , 
function Kappa = CoomputeKappa(HH, Gamma, Iu,Iv, f)
beta = 1/f;
[w,h,~,~] = size(HH);
Kappa = zeros(w,h,6);
for i = 1:w
    for j = 1:h
        H = HH(i,j,:,:);
        g = Gamma(i,j,:);
        g1 = g(1);g2 = g(2);g3 = g(3);
        k1 = (g2 + g1.*Iu(i,j) - Iu(i,j))*H(1,2) - (g3 + g1.*Iv(i,j) - Iv(i,j))*H(1,1);
        k2 = beta*(g2 + g1.*Iu(i,j))*H(1,2) - beta*(g3 + g1.*Iv(i,j))*H(1,1);
        k3 = (g2 + g1.*Iu(i,j) - Iu(i,j))*H(2,2) - (g3 + g1.*Iv(i,j) - Iv(i,j))*H(2,1);
        k4 = beta*(g2 + g1.*Iu(i,j))*H(2,2) - beta*(g3 + g1.*Iv(i,j))*H(2,1);
        k5 = - (g2 + g1.*Iu(i,j) - Iu(i,j))*H(3,2) + (g3 + g1.*Iv(i,j) - Iv(i,j))*H(3,1);
        k6 = - beta*(g2 + g1.*Iu(i,j))*H(3,2) + beta*(g3 + g1.*Iv(i,j))*H(3,1);
        
        Kappa(i,j,:) = [k1, k2, k3, k4, k5, k6];
    end
end