% This function is used to constrcut the optimal equation.
% INPUT:
%      -- a             , the 
%      -- M             , M_R, M_G, M_B
%      -- meanAA        , the focal length of the camera
%      -- r             , the radius of the 
%      -- eta           , weight of the smooth term.
% OUTPUT:
%      -- FunA          , the agggress of the optimal equation.
function FunA = ConstructFunAA(a, M_R, M_G, M_B, meanAA ,r, eta)
DataTerm = 0;
SmoothTerm = 0;
for i = 1:r
    for j =1:r
      D_R = M_R{i,j};
      DT1 = (D_R(1)*a(0)^2+D_R(2)*a(0)*a(1)+D_R(3)*a(1)*a(3)+D_R(4)*a(2)^2+D_R(5)*a(2)*a(3)+D_R(6)*a(6)^2+D_R(6)*a(1)+D_R(7))^2;
      D_G = M_G{i,j};
      DT2 = (D_G(1)*a(0)^2+D_G(2)*a(0)*a(1)+D_G(3)*a(1)*a(3)+D_G(4)*a(2)^2+D_G(5)*a(2)*a(3)+D_G(6)*a(6)^2+D_G(6)*a(1)+D_G(7))^2;
      D_B = M_B{i,j};
      DT3 = (D_B(1)*a(0)^2+D_B(2)*a(0)*a(1)+D_B(3)*a(1)*a(3)+D_B(4)*a(2)^2+D_B(5)*a(2)*a(3)+D_B(6)*a(6)^2+D_B(6)*a(1)+D_B(7))^2;
      DataTerm = DataTerm + DT1 + DT2 + DT3;
      SmoothTerm = SmoothTerm + (a(4)-meanAA(4))^2 + (a(5)-meanAA(5))^2 + (a(6)-meanAA(6))^2;
    end
end
FunA = DataTerm + eta * SmoothTerm;