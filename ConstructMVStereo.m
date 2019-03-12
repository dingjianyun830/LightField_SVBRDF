%% Construct Multi-view Camera Stereo
% This funtion is used to constrcut the multi-view camera stereo by the
% light field image.
% INPUT:
%      -- MVImgSet      , the multiview image set
%      -- opt           , the option parameter of the differential computation
% OUTPUT:
%      -- B             , the first matrix of the non linear ssytem
%      -- DeltaI        , the martix of the differential stereo of multi cameras
%      -- Iu            , the horizental direction of spatial derivatives
%      -- Iv            , the vertical direction of spatial derivatives
function [B, DeltaI, Iu, Iv] = ConstructMVStereo(MVImgSet, LF_Para, opt)
x_size =  LF_Para.x_size;
y_size =  LF_Para.y_size;
color_channel = LF_Para.color_channel;

% Set the central view camera as the target

w = opt.Cam_With;
h = opt.Cam_Height;
cen_x = round(w/2);
cen_y = round(h/2);
Cam0 = MVImgSet{cen_y,cen_x};

% compute difference between the cameras
m = w*h;
tau_x = zeros(m,1);
tau_y = zeros(m,1);

% compute the differential
DeltaI = zeros(x_size, y_size, color_channel, m);
count = 1;
for i = 1 : h
    for j = 1 : w
        Cam1 = MVImgSet{i,j};
        tau_x(count)    = j - cen_x;
        tau_y(count)    = i - cen_y;    
        DeltaI(:,:,:,count)   = Cam0 - Cam1;
        count = count+1;
    end
end
% delete the center camera part
middle_index = round(m/2);
tau_x(middle_index) =[];
tau_y(middle_index) =[];
DeltaI(:,:,:,middle_index)=[];

% compute the spatial derivative of Image of central camera
[Iu, Iv] = ComputeSpatialDerivate(Cam0,opt);

% construct the first matrix of the non linear ssytem
B = ConstructB(Iu,Iv,tau_x,tau_y);        