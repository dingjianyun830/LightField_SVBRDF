%% Shape Estimation
% This function is used to estimate the shape by polynomial regularization
% INPUT:
%      -- Kappa         , 1*6 array
%      -- LF_Para       , the parameters of the light field 
%      -- opt           , option
% OUTPUT:
%      -- Z      , the depth of the shape
function Z = ShapeEstimation(Kappa ,LF_Para, opt)
% create a empty Z
w = LF_Para.x_size;
h = LF_Para.y_size;
c = LF_Para.color_channel;

Z = zeros(w, h);

% set the radius of the image patch
r = opt.radius_shape;
beta = 1/opt.FocalLength;
% set the weight 
eta = 1000;

AA = zeros(w,h,6);
for i = round(r/2) : w - round(r/2)
    for j = round(r/2) : h - round(r/2)
        a = squeeze(AA(i,j,:));
        
        % compute the Average AA for smooth term
        meanAA = ComputeAverageAA(AA,i,j);
        
        M_R = ConstructM(beta, squeeze(Kappa(i,j,1,:)), i, j , r);
        M_G = ConstructM(beta, squeeze(Kappa(i,j,2,:)), i, j , r);
        M_B = ConstructM(beta, squeeze(Kappa(i,j,3,:)), i, j , r);
        fun = @(a) ConstructFunAA(a, M_R, M_G, M_B, meanAA, r, eta);
        options.Algorithm = 'levenberg-marquardt';
        a = lsqnonlin(fun,a,[],[],options);
        AA(i,j,:) = a;
    end
end



