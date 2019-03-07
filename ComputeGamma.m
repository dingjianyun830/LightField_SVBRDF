%% Compute the gamma
% This function is used to compute the gamma
% INPUT:
%      -- B      , the first matrix of the non-linear system
%      -- DeltaI , difference of the intensity of multi-view cameras
% OUTPUT:
%      -- gamma ,
function gamma = ComputeGamma(B, DeltaI)
[w,h,m,~] = size(B);
Bp = zeros(w,h,3,m);
gamma = zeros(w,h,3);
% compute the Moore-Prenrose pseudoinverse of B
for i = 1:w
    for j = 1:h
        temp = B(i,j,:,:);
        Bp(i,j,:,:) = pinv(temp);
        gamma(i,j,:) = pinv(temp)*DeltaI(i,j,:);
    end
end

