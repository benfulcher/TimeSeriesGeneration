function dx = F_ACT(t,x)
% ACT attractor

if nargin<3 || isempty(params)
	params = [1.8, -0.07, 1.5, 0.02]; % [alpha, beta, delta, mu]
end
alpha = params(1);
beta = params(2);
delta = params(3);
mu = params(4);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = alpha*(x(1)-x(2));
dx(2) = -4*alpha*x(2) + x(1)*x(3) + mu*x(1)^3;
dx(3) = -delta*alpha*x(3) + x(1)*x(2) + beta*x(3)^2;

end
