%% run the LF Data

% load a test image from synthesic Lift field image
%load('LFDATA.mat');
LF = LFData_imgs;
% Set the parameters of LF_Data
% DataType    ,0 -- Synthesic Image,1 -- Lytro,2 -- Lytro Illum
DataType = 0;
LF_Para = SetLFPara(DataType);

% Set the option for the algorithm
opt.Cam_Index_Center    = [6,6];
opt.Cam_With      = 7;
opt.Cam_Height    = 7;
opt.SDerivateMethod = 'prewitt';

% Transform the LF data into subapture image set
[SubAperSet, SubAperImg] = LF2SubAperture(LF, LF_Para);

% Select the MultiView Images
[MVImgSet, CenImg] = SelectMultiView(SubAperSet,LF_Para,opt);

[B, DeltaI, Iu, Iv] = ConstructMVStereo(MVImgSet,LF_Para,opt);

% set the lightSource position and intrinsic parameters of camera 
opt.LightVec = ld_gt;
opt.K = K;
opt.FocalLength = K(1,1);
% compute the viewpoint
opt.ViewVec = ComputeViewVector(LF_Para,opt);

% SVBRDF
[Gamma, H, Kappa] = SVBRDF(B, DeltaI, Iu, Iv, LF_Para, opt);

opt.radius_shape = 3;
% shape from shading
Z = ShapeEstimation(Kappa, LF_Para, opt);