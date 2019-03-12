%% This function is used to compute the viewpoint vector
function ViewVec = ComputeViewVector(LF_Para,opt)

% size of the image
w = LF_Para.x_size;
h = LF_Para.y_size;
% the intrinsic parameters of the camera
K = opt.K;
% the baseline of the two virtual camera
ViewVec = zeros(w,h,3);
for i = 1:w
    for j= 1:h
        temp = [i;j;1];
        temp1 = K\temp;
        ViewVec(i,j,:) = temp1/norm(temp1);
    end
end
        