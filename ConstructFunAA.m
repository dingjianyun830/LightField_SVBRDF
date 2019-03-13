% This function is used to constrcut the optimal equation.
% INPUT:

%      -- eta           , weight of the smooth term.
% OUTPUT:
%      -- FunA          , the agggress of the optimal equation.
function FunA = ConstructFunAA(Kappa,AA, a, i, j, opt, eta)

% compute the data and smooth term
DataTerm = AggDataTerm(Kappa, a, i, j, opt);
SmoothTerm = AggSmoothTerm(AA, a, i, j, opt);
FunA = DataTerm + eta*SmoothTerm;