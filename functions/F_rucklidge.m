function dx = F_rucklidge(t,x,params)
% Rucklidge Attractor

if nargin<3 || isempty(params)
	params = [2, 6.7];
end
kappa = params(1);
lambda = params(2);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = -kappa*x(1) + lambda*x(2) - x(2)*x(3);
dx(2) = x(1);
dx(3) = -x(3) + x(2)^2;

end
