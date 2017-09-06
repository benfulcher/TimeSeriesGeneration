function dx = F_ShawvdP(t,x,params)
% Shaw-van der Pol oscillator

if nargin<3 || isempty(params)
	params = [1, 1, 2]; % [b, A, Omega]
end

b = params(1);
A = params(2);
Omega = params(3);
% b=1;A=1;Omega=2;

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(2) + A*sin(Omega*t);
dx(2) = -x(1) + b*(1-x(1)^2)*x(2);

end
