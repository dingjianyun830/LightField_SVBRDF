%% Compute Half angle vector
% This function is used to construct the Kappa array.
% INPUT:
%      -- LF_Para, the parameter of the light field 
%      -- opt   , the light direction and the view direction.
% OUTPUT:
%      -- H      , Big H Vectot
function H_vec = ComputeHalfAngle(LF_Para,opt)

% set the size of the image
w = LF_Para.x_size;
h = LF_Para.y_size;

% set the light and view direction
s = opt.LightVec';
ViewVec = opt.ViewVec;

% compute the big H
H_vec = zeros(w,h,3,3);
II = eye(3); 
for i = 1:w
    for j = 1:h
        % compute the half-angle direction
        % every pixel corresponding a view direction
        v = squeeze(ViewVec(i,j,:));
        temp1 = s + v;
        h_vec = temp1/norm(temp1);
        
        hh = h_vec*h_vec';
        vv = v*v';
        H_vec(i,j,:,:) = (II - hh)*(II - vv);
    end
end