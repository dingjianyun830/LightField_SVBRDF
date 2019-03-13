%% run the LF Data

% load a test image from synthesic Lift field image
load('LFDATA.mat');
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

% set the lightSource position and intrinsic parameters of camera 
opt.CenCamPos = squeeze(cam_pos(6,6,:));
opt.LightVec = ld_gt;
opt.K = K;
opt.FocalLength = 1;
opt.radius_shape = 5;

% Transform the LF data into subapture image set
[SubAperSet, SubAperImg] = LF2SubAperture(LF, LF_Para);

% Select the MultiView Images
[MVImgSet, CenImg] = SelectMultiView(SubAperSet,LF_Para,opt);

[B, DeltaI, Iu, Iv] = ConstructMVStereo(MVImgSet,LF_Para,opt);

% compute the viewpoint
opt.ViewVec = ComputeViewVector(LF_Para,opt);

% SVBRDF
[Gamma, H, Kappa] = SVBRDF(B, DeltaI, Iu, Iv, LF_Para, opt);

% shape from shading
[AA, Z] = ShapeEstimation(Kappa, LF_Para, opt);

% show the ground truth and the estimate result
A = Z<0;
Z1 = Z;
Z1(A) = NaN;
[XX,YY] = meshgrid(1:LF_Para.x_size);
subplot(1,2,1);
mesh(XX,YY,dpth_maps(:,:,10*11+6));
subplot(1,2,2);
mesh(XX,YY,Z1);
