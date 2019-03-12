%% This function is used to set the parameters of Light Field Data
% According to the data source, the parameters has different category
% Input: 
%           DataType    ,0 -- Synthesic Image,1 -- Lytro,2 -- Lytro Illum
% Output:
%           LF_Para
%                  --
function LF_Para = SetLFPara(DataType)
switch DataType
    case 0
        LF_Para.CamType = 0;
        %%% LF sizes                --------------
        UV_radius = 5;
        LF_Para.UV_radius           = UV_radius      ;
        LF_Para.UV_diameter         = (2*UV_radius+1);
        LF_Para.UV_size             = LF_Para.UV_diameter^2  ;
        %%% Image sizes     --------------
        LF_Para.x_size              = 400;
        LF_Para.y_size              = 400;
        LF_Para.color_channel       = 3;
        %%% 
    case 1
        LF_Para.CamType = 1;
    case 2
        LF_Para.CamType = 2;
        %%% LF sizes                        --------------
        LF_Para.UV_radius           = 7 ;
        LF_Para.UV_diameter         = 15;
        LF_Para.UV_size             = 15^2;
        %%% Raw Image sizes                        --------------
        LF_Para.width               = 7728;
        LF_Para.height              = 5368;
        %%% Image sizes                        --------------
        LF_Para.y_size               = 434;
        LF_Para.x_size               = 625;
        LF_Para.color_channel        = 3;
        
        %%%
        LF_Para.BaseLine = 1;
    otherwise
        disp('The DataType should be 0,1,2');
end