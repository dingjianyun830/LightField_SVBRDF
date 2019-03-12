%% Construct the B matrix
% This function is used to construct the first matrix of the non-linear
% system.
% INPUT:
%      -- Iu     , horizental direction
%      -- Iv     , vertical direction
%      -- tau_x  , horizontal differential of two cameras
%      -- tau_y  , vertical differential of two cameras
% OUTPUT:
%      -- B      , the first matrix of the non linear system
function B = ConstructB(Iu, Iv, tau_x ,tau_y)
[m,~] = size(tau_x);
[w,h,c] = size(Iu);
B1 = zeros(w,h,c,m);
for k = 1:c
    for i = 1:m
        B1(:,:,k,i) = Iu(:,:,k).*tau_x(i)+Iv(:,:,k).*tau_y(i);
    end
end
B.B1 = B1;
B.B2 = tau_x;
B.B3 = tau_y;