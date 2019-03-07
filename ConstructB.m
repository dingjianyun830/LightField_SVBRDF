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
[~,m] = size(tau_x);
[w,h] = size(Iu);
B1 = zeros(w,h,m);
for i = 1:m
    B1(:,:,m) = Iu.*tau_x(i)+Iv.*tau_y(i);
end

B = zeros(w,h,m,3);
for i = 1:w
    for j = 1:h
        B(i,j,m,3) = [B1(i,j,:) tau_x tau_y];
    end
end
