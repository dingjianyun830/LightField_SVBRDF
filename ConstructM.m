%% SVBRDF - Invariant
% This function is used to construct the SVBRDF-invariant
% INPUT:
%      -- beta          , 1/f
%      -- Kappa         , the parameter of PDE
%      -- u             , the pixel coordinate
%      -- v             , the pixel coordinate
% OUTPUT:
%      -- M             , the Matrix of Data term
function M = ConstructM(beta, Kappa, u, v , r)
% construct the M
M = cell(r,r);
for i = 1:r
    for j = 1:r
        D = zeros(1,7);
        D(1) = 3*beta*Kappa(6)+2*Kappa(2)*u^3;
        D(2) = 2*(3*beta*Kappa(6)*u^2*v^2 + Kappa(4)*u^2*v + Kappa(2)*u*v^2);
        D(3) = Kappa(4)*u^3 + 3*Kappa(2)*u^2*v + 6*beta*Kappa(6)*u^3*v;
        D(4) = 3*beta*Kappa(6)*v^4 + 2*Kappa(4)*v^3;
        D(5) = Kappa(2)*v^3 + 3*Kappa(4)*u*v^2 + 6*beta*u*v^3;
        D(6) = beta*Kappa(6);
        D(7) = Kappa(5);
        M(i,j) = D;
    end
end