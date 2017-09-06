function dx = F_DPend(t,x,params)
% A Driven Pendulum

if nargin<3 || isempty(params)
	params = [0.6, 0.05, 0.7]; % [A, b, Omega]
end
A = params(1);
b = params(2);
Omega = params(3);

% A=0.6; b=0.05; Omega=0.7;

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(2);
dx(2) = -b*x(2)-sin(x(1))+A*sin(Omega*t);

end
