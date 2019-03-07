%% Construct Multi-view Camera Stereo
% This funtion is used to constrcut the multi-view camera stereo by the
% light field image.
% INPUT:
%      -- SubAperSet    , the sub aperture image also the multiview image.
%      -- opt           , the option parameter of the differential computation
% OUTPUT:
%      -- B             , the first matrix of the non linear ssytem
%      -- DeltaI        , the martix of the differential stereo of multi cameras
%      -- Iu            , the horizental direction of spatial derivatives
%      -- Iv            , the vertical direction of spatial derivatives
function [B, DeltaI, MVImg, Iu, Iv] = ConstructMVStereo(SubAperSet,opt)

% Set the central view camera as the target
cam_index_center_w = opt.Cam_Index_Center(1);
cam_index_center_h = opt.Cam_Index_Center(2);
Cam0 = SubAperSet{cam_index_center};

cam_num_w = opt.Cam_With;
cam_num_h = opt.Cam_Height;

% compute difference between the cameras
m = cam_num_w*cam_num_h;
tau_x = zeros(1,m);
tau_y = zeros(1,m);

% compute the differential
DeltaI = cell(1,m);
count = 1;
for i = cam_index_center_w - fix(cam_num_w/2) : cam_index_center_w + fix(cam_num_w/2)
    for j = cam_index_center_h - fix(cam_num_h/2) : cam_index_center_h + fix(cam_num_h/2)
        Cam1 = SubAperSet{i,j};
        tau_x(count)    = j;
        tau_y(count)    = i;    
        DeltaI{count}   = Cam0 - Cam1;
        count = count+1;
    end
end
% delete the center camera part
middle_index = round(m/2);
tau_x(middle_index) =[];
tau_y(middle_index) =[];
DeltaI{middle_index}=[];

% compute the spatial derivative of Image of central camera
[Iu, Iv] = ComputeSpatialDerivate(Cam0,opt);

% construct the first matrix of the non linear ssytem
B = ConstructB(Iu,Iv,tau_x,tau_y);        