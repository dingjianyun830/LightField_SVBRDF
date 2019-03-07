% This function is used to constrcut the optimal equation.
% INPUT:
%      -- a             , the 
%      -- M             , 
%      -- meanAA        , the focal length of the camera
%      -- r             , the radius of the 
%      -- eta           , weight of the smooth term.
% OUTPUT:
%      -- FunA          , the agggress of the optimal equation.
function FunA = ConstructFunAA(a, M, meanAA ,r, eta)
DataTerm = 0;
SmoothTerm = 0;
for i = 1:r
    for j =1:r
      D = M{i,j};
      DataTerm = DataTerm + (D(1)*a(0)^2+D(2)*a(0)*a(1)+D(3)*a(1)*a(3)+D(4)*a(2)^2+D(5)*a(2)*a(3)+D(6)*a(6)^2+D(6)*a(1)+D(7))^2;
      SmoothTerm = SmoothTerm + (a(4)-meanAA(4))^2 + (a(5)-meanAA(5))^2 + (a(6)-meanAA(6))^2;
    end
end
FunA = DataTerm + eta * SmoothTerm;