%% SVBRDF - Invariant
% This function is used to construct the SVBRDF-invariant
% INPUT:
%      -- B             , the first matrix of the non-linear system
%      -- DeltaI        , difference of the intensity of multi-view cameras
%      -- LF_Para       , the parameters of the light field 
%      -- opt           , option of algorithm
% OUTPUT:
%      -- Kappa  , the parameter of PDE
function [Gamma, H, Kappa] = SVBRDF(B, DeltaI, Iu, Iv, LF_Para, opt)

% compute the gamma
Gamma = ComputeGamma(B, DeltaI);

% compute the H, half-angle vector
H = ComputeHalfAngle(LF_Para,opt);

Kappa = ComputeKappa(H, Gamma, Iu, Iv, LF_Para, opt);