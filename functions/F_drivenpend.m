function dx = F_drivenpend(t,x,params)
% Driven Pendulum

if nargin<3 || isempty(params)
	params = [1.0; 0.5]; % [A, Omega]
end
A = params(1);
Omega = params(2);
% A=1.0; Omega=0.5;

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(2);
dx(2) = -sin(x(1)) + A*sin(Omega*t);

end
