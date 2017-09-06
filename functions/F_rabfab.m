function dx = F_rabfab(t,x,params)
% Rabinovich-Fabrikant attractor

if nargin<3 || isempty(params)
	params = [1.1, 0.87]; % [alpha, gamma]
end
alpha = params(1);
gamma = params(2);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2)*(x(3) - 1 + x(1)^2) + gamma*x(1);
dx(2) = x(1)*(3*x(3) + 1 - x(1)^2) + gamma*x(2);
dx(3) = -2*x(3)*(alpha+x(1)*x(2));

end
