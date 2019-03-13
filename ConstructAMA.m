
%% SVBRDF - Invariant
% This function is used to construct the SVBRDF-invariant
% INPUT:
%      -- beta          , 1/f
%      -- Kappa         , the parameter of PDE
% OUTPUT:
%      -- AMA             , the Matrix of Data term
function AMA = ConstructAMA(beta, a, Kappa, u, v)
AMA = zeros(1,8);

AMA(1) = 3 * beta * Kappa(6) * u^4 + 2 * Kappa(2) * u^3;
AMA(2) = 2 * ( 3 * beta * Kappa(6) * u^2 * v^2 + Kappa(4) * u^2 * v + Kappa(2) * u * v^2);
AMA(3) = Kappa(4) * u^3 + 3 * Kappa(2) * u^2 * v + 6 * beta * Kappa(6) * u^3 * v;
AMA(4) = 3 * beta * Kappa(6) * v^4 + 2 * Kappa(4) * v^3;
AMA(5) = Kappa(2) * v^3 + 3 * Kappa(4) * u * v^2 + 6 * beta * Kappa(6) * u * v^3;
AMA(6) = beta * Kappa(6);
AMA(7) = 2 * Kappa(1) * u + Kappa(6) * u^2 + 3 * beta * Kappa(5) * u^2;
AMA(8) = Kappa(5);

AMA = AMA(1)*a(1)^2 + AMA(2)*a(1)*a(2) + AMA(3)*a(1)*a(3) + AMA(4)*a(2)^2 + AMA(5)*a(2)*a(3) + AMA(6)*a(6)^2 + AMA(7)*a(1) + AMA(8);
AMA = AMA^2;