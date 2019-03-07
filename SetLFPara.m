%% This function is used to set the parameters of Light Field Data
% According to the data source, the parameters has different category
% Input: 
%           DataType    ,0 -- Synthese Image,1 -- Lytro,2 -- Lytro Illum
% Output:
%           LF_Para
%                  --
function LF_Para = SetLFPara(DataType)
switch DataType
    case 0
        LF_Para.CamType = 'Syn';
        %%% LF sizes                --------------
        LF_Para.UV_radius           = 3              ;
        LF_Para.UV_diameter         = (2*UV_radius+1);
        LF_Para.UV_size             = UV_diameter^2  ;
        %%% PNG Raw Image sizes     --------------
        LF_Para.x_size              = 2310;
        LF_Para.y_size              = 2667;
        %%% 
    case 1
        LF_Para.CamType = 'Lytro';
    case 2
        LF_Para.CamType = 'Illum';
        %%% LF sizes                        --------------
        LF_Para.UV_radius           = 7              ;
        LF_Para.UV_diameter         = (2*UV_radius+1);
        LF_Para.UV_size             = UV_diameter^2  ;
        %%% PNG Raw Image sizes                        --------------
        LF_Para.x_size              = 0;
        LF_Para.y_size              = 0;
        
    otherwise
        disp('The DataType should be 0,1,2');
end