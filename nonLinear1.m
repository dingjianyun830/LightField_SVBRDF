%% This function is used to compute the optimal a by matlab nonlinear function

function a = nonLinear1(Kappa,AA, a, i, j, opt, eta)
fun = @(a) ConstructFunAA(Kappa,AA, a, i, j, opt, eta);
%options = optimoptions('lsqnonlin','Display','iter');
options = optimset('display','off');
options.Algorithm = 'levenberg-marquardt';
a = lsqnonlin(fun,a,[],[],options);