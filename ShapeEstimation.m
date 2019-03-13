%% Shape Estimation
% This function is used to estimate the shape by polynomial regularization
% INPUT:
%      -- Kappa         , 1*6 array
%      -- LF_Para       , the parameters of the light field 
%      -- opt           , option
% OUTPUT:
%      -- Z      , the depth of the shape
function [AA,Z] = ShapeEstimation(Kappa ,LF_Para, opt)
% create a empty Z
w = LF_Para.x_size;
h = LF_Para.y_size;
c = LF_Para.color_channel;

% set the radius of the image patch
r = opt.radius_shape;
% set the weight 
eta = 1000;

AA = zeros(w,h,6);
for i = round(r/2) : w - round(r/2)
    disp(['Process...' num2str(i)]);
    for j = round(r/2) : h - round(r/2)
        a = squeeze(AA(i,j,:));       
        AA(i,j,:) = nonLinear1(Kappa,AA, a, i, j, opt, eta);
    end
end

Z = zeros(w,h);
for i = round(r/2) : w - round(r/2)
    for j = round(r/2) : h - round(r/2)
        aa = AA(i,j,:);
        Z(i,j) = aa(1)*i^2 + aa(2)*j^2 + aa(3)*i*j + aa(4)*i + aa(5)*j + aa(6);
    end
end


