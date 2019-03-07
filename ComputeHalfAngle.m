%% Compute Half angle vector
% This function is used to construct the Kappa array.
% INPUT:
%      -- s      , light source vector
%      -- v      , viewpoint vector
%      -- v      , viewpoint vector
% OUTPUT:
%      -- H      , Half - angle vector
function H = ComputeHalfAngle(s, v, MVImg)

[w,h,m] = size(MVImg);

% compute the half-angle direction
for k = 1:m
    h(:,:,k) = (s+v(:,:,k))/norm(s+v(:,:,k));
end

% compute the big H
H = zeros(w,h,m,3,3);
for k = 1:m
    hh = h(:,:,k)*h(:,:,k);
    vv = v(:,:,k)*v(:,:,k);
    for i = 1:w
        for j = 1:h
            H(i,j,m,:,:) = (MVImg(i,j,m)-hh)*(MVImg(i,j,m)-vv);
        end
    end
end