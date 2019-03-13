%% this function is used to aggregate the data term for optimization.
% INPUT:
%      -- u             , the pixel coordinate
%      -- v             , the pixel coordinate
function DataTerm = AggDataTerm(Kappa, a, u, v,opt)

% set the size of the patch 
r = opt.radius_shape;
beta = 1/opt.FocalLength;

DataTerm = 0;
for c = 1:3
    for i = -fix(r/2):fix(r/2)
        for j = -fix(r/2):fix(r/2)
            %A1 = [a' 1];
            %M = ConstructM(beta, Kappa(u+i,v+j,c,:), u, v);
            
            DataTerm = DataTerm + ConstructAMA(beta, a, Kappa(u+i,v+j,c,:), u, v);
        end
    end
end
DataTerm = DataTerm/3;
