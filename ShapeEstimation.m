%% Shape Estimation
% This function is used to estimate the shape by polynomial regularization
% INPUT:
%      -- Kappa  , 1*6 array
%      -- g      , 1*3 gammar array
%      -- f      , the focal length of the camera
%      -- F      , the finite the focused distance
%      -- Diff_I , the differential of two Images
% OUTPUT:
%      -- Z      , the depth of the shape
function Z = ShapeEstimation(Kappa, opt)
% create a empty Z
w = opt.ImgWidth;
h = opt.ImgHeight;
Z = zeros(w, h);

% set the radius of the image patch
r = opt.radius_shape;
beta = 1/f;
% set the weight 
eta = 1000;

AA = zeros(w,h,6);
for i = r/2:w-r/2
    for j = r/2:h-r/2
        a = AA(i,j,:);
        
        % compute the Average AA for smooth term
        meanAA = ComputeAverageAA(AA,i,j);
        
        M = ConstructM(beta, Kappa, i, j , r);
        fun = @(a) ConstructFunAA(a, M, meanAA, r, eta);
        options.Algorithm = 'levenberg-marquardt';
        a = lsqnonlin(fun,a,[],[],options);
        AA(i,j,:) = a;
    end
end


