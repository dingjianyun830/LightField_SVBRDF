%% this function is used to aggregate the data term for optimization.
% INPUT:
%      -- u             , the pixel coordinate
%      -- v             , the pixel coordinate
function SmoothTerm = AggSmoothTerm(AA, a, u, v, opt)

% set the size of the patch 
r = opt.radius_shape;

SmoothTerm = 0;
for i = -fix(r/2):fix(r/2)
    for j = -fix(r/2):fix(r/2)
        meanAA = ComputeAverageAA(AA, u, v);
        SmoothTerm = SmoothTerm + (a(4)-meanAA(4))^2 + (a(5)-meanAA(5))^2 + (a(6)-meanAA(6))^2;
    end
end