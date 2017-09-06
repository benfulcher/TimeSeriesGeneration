function dx = F_duffvdp(t,x,params)
% A Duffing-van der Pol oscillator

if nargin<3 || isempty(params)
	params = [0.2, 8, 0.35, 1.02]; % [mu, gamma, A, Omega]
end
mu = params(1);
gamma = params(2);
A = params(3);
Omega = params(4);
% mu=0.2;gamma=8;A=0.35;Omega=1.02;

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(2);
dx(2) = mu*(1-gamma*x(1)^2)*x(2) - x(1)^3 + A*sin(Omega*t);

end
