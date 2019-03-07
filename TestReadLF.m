%% run the LF Data

% load a test image from the Lytro Illum
load('D:\100PHOTO\Images\AA001\IMG_0604__Decoded.mat');

% Set the parameters of LF_Data
LF_Para = SetLFPara(DataType);

% Set the option for the algorithm
opt.Cam_Index_Center    = [8,8];
opt.Cam_With      = 7;
opt.Cam_Height    = 7;
opt.SDerivateMethod = 'prewitt';

% Transform the LF data into subapture image set
[SubAperSet, SubAperImg] = LF2SubAperture(LF, LF_Para);

[B, DeltaI, MVImg, Iu, Iv] = ConstructMVStereo(SubAperSet,opt);

% set the lightSource position and compute the viewpoint

% SVBRDF
Kappa = SVBRDF(B, DeltaI, MVImg, Iu, Iv ,lightSource, ViewPoint);

% shape from shading
Z = ShapeEstimation(Kappa);