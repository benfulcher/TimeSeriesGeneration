function dx = F_rayduff(t,x,params)
% A Rayleigh-Duffing Oscillator

if nargin<3 || isempty(params)
	params = [0.2, 4, 0.3, 1.1]; % [mu, gamma, A, Omega]
end
mu = params(1);
gamma = params(2);
A = params(3);
Omega = params(4);
% mu=0.2;gamma=4;A=0.3;Omega=1.1;

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(2);
dx(2) = mu*(1-gamma*x(2)^2)*x(2) - x(1)^3 + A*sin(Omega*t);

end
