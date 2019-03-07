%% This function is used to transform the 5D image into sub-aperture image sets
% Input:
%         LF            ,5D data type [u,v,w,h,c]
% Output:
%         SubAperSet,   ,a cell u*v of sub-aperture image.
%         SubAperImg,   ,a whole image for all subaperture image.

function [SubAperSet, SubAperImg] = LF2SubAperture(LF, LF_Para)
UV_diameter = LF_Para.UV_diameter;

SubAperSet = cell(UV_diameter,UV_diameter);
for i = 1:UV_diameter
    for j = 1:UV_diameter
        SubAperSet{i,j} = LF(i:UV_diameter:end,j:UV_diameter:end,:);
    end
end

SubAperImg = cell2mat(SubAperSet);

% display the whole sub-aperture image
imshow(SubAperImg);