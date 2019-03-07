%% SVBRDF - Invariant
% This function is used to construct the SVBRDF-invariant
% INPUT:
%      -- B             , the first matrix of the non-linear system
%      -- DeltaI        , difference of the intensity of multi-view cameras
%      -- f             , the focal length of the camera
%      -- F             , the finite the focused distance
%      -- DeltaI        , the differential of two Images
%      -- MVImg         , the differential of two Images
%      -- lightSource   , the differential of two Images
%      -- ViewPoint     , the differential of two Images
% OUTPUT:
%      -- Kappa  , the parameter of PDE
function Kappa = SVBRDF(B, DeltaI, MVImg, Iu, Iv, lightSource, ViewPoint)

% compute the gamma
gamma = ComputeGamma(B, DeltaI);

% compute the H, half-angle vector
H = ComputeHalfAngle(lightSource, ViewPoint, MVImg);

Kappa = CoomputeKappa(H, gamma, opt.f, Iu, Iv);