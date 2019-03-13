%% This function is used to transform the 5D image into sub-aperture image sets
% Input:
%         LF            ,5D data type [u,v,w,h,c]
% Output:
%         SubAperSet,   ,a cell u*v of sub-aperture image.
%         SubAperImg,   ,a whole image for all subaperture image.

function [SubAperSet, SubAperImg] = LF2SubAperture(LF, LF_Para)
switch LF_Para.CamType
    case 0
        UV_diameter = LF_Para.UV_diameter;
        SubAperSet = cell(UV_diameter,UV_diameter);
        for i = 1:UV_diameter
            for j = 1:UV_diameter
                SubAperSet{j,i} =  squeeze(LF(:,:,:,(i-1)*UV_diameter+j));
            end
        end
        SubAperImg = cell2mat(SubAperSet);
    case 2
        UV_diameter = LF_Para.UV_diameter;
        
        SubAperSet = cell(UV_diameter,UV_diameter);
        for i = 1:UV_diameter
            for j = 1:UV_diameter
                SubAperSet{i,j} =  im2double(squeeze(LF(i,j,:,:,1:3)));
                %SubAperSet{i,j} = LF(i:UV_diameter:end,j:UV_diameter:end,:);
            end
        end
        SubAperImg = cell2mat(SubAperSet);
        
        % display the whole sub-aperture image
        %imshow(SubAperImg);
end

