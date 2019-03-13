%% This function is used to select the MVImage from the SubAperSet.
% the MVImageSet is a set of the subaperture image.
% Input:
%        SubAperSet     , the set of subaperture image
%        opt.Cam_With   , the width number of multi view camera 
%        opt.Cam_Height , the height number of multi view camera
%        LF_Para.UV_diameter ,the diameter of the SubAperSet 
% Output:
%       MVImageSet, the multi view images
function [MVImgSet,CenImg] = SelectMultiView(SubAperSet, LF_Para, opt)
cen_x = round(LF_Para.UV_diameter/2);
cen_y = round(LF_Para.UV_diameter/2);
w = opt.Cam_With;
h = opt.Cam_Height;
MVImgSet = cell(h,w);
for i = 1 : h 
    for j = 1 : w
        MVImgSet{i,j} = SubAperSet{cen_y - fix(h/2) + i,cen_x - fix(w/2) + j};
    end
end
CenImg = SubAperSet{cen_y,cen_x};
% figure;
% imshow(cell2mat(MVImgSet));