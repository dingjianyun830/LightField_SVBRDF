%% Compute Differential Stereo
% This function is used to compute the differential stereo for two views
% INPUT:
%      -- Cam0  , the image from the central camera(p)
%      -- Cam1  , the image from other camera(p+tau)
% OUTPUT:
%      -- deltaI, the differential of two cameras
function deltaI = ComputeDiff(Cam0, Cam1)

diff_I = Cam0 - Cam1;