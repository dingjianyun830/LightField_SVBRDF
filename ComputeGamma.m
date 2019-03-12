%% Compute the gamma
% This function is used to compute the gamma
% INPUT:
%      -- B      , the first matrix of the non-linear system
%      -- DeltaI , difference of the intensity of multi-view cameras
% OUTPUT:
%      -- gamma ,
function gamma = ComputeGamma(B, DeltaI)
[w,h,c,m] = size(B.B1);
%Bp = zeros(w,h,c,m);
gamma = zeros(w,h,c,3);
% compute the Moore-Prenrose pseudoinverse of B
for k = 1:c
    for i = 1:w
        for j = 1:h
            tempA = [squeeze(B.B1(i,j,k,:)) B.B2 B.B3];
            tempB = squeeze(DeltaI(i,j,k,:));
            %Bp(i,j,:,:) = pinv(tempA);
            
            gamma(i,j,k,:) = pinv(tempA)*tempB;
        end
    end
end

