%% Compute the spatial derivatives
% This function is used to compute the Iu and Iv of image I
% INPUT:
%      -- I      , the image
%      -- opt    , the method: 'sobel' | 'prewitt' | 'central' | 'intermediate'
% OUTPUT:
%      -- Iu     , horizental direction
%      -- Iv     , vertical direction
function [Iu, Iv] = ComputeSpatialDerivate(I,opt)
[m,n,D] = size(I);
Iu = zeros(m,n,D);
Iv = zeros(m,n,D);
for i = 1:D
    [Iu(:,:,i), Iv(:,:,i)] = imgradientxy(I(:,:,i),opt.SDerivateMethod);
end