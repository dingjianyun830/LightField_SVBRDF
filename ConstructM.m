%% SVBRDF - Invariant
% This function is used to construct the SVBRDF-invariant
% INPUT:
%      -- beta          , 1/f
%      -- Kappa         , the parameter of PDE
% OUTPUT:
%      -- M             , the Matrix of Data term
function M = ConstructM(beta, Kappa, u, v)
% construct the M
M = zeros(7,7);

M(1,1) = 3 * beta * Kappa(6) * u^4 + 2 * Kappa(2) * u^3;
M(1,2) = 2 * ( 3 * beta * Kappa(6) * u^2 * v^2 + Kappa(4) * u^2 * v + Kappa(2) * u * v^2);
M(1,3) = Kappa(4) * u^3 + 3 * Kappa(2) * u^2 * v + 6 * beta * Kappa(6) * u^3 * v;
M(2,2) = 3 * beta * Kappa(6) * v^4 + 2 * Kappa(4) * v^3;
M(2,3) = Kappa(2) * v^3 + 3 * Kappa(4) * u * v^2 + 6 * beta * Kappa(6) * u * v^3;
M(6,6) = beta * Kappa(6);
M(1,7) = 2 * Kappa(1) * u + Kappa(6) * u^2 + 3 * beta * Kappa(5) * u^2;
M(7,7) = Kappa(5);

