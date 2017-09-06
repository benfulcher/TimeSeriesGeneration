function dx = F_FBruss(t,x,params)
% Forced Brusselator

if nargin<3 || isempty(params)
	params = [0.4, 1.2, 0.05, 0.8]; % [a,b,A,Omega]
end
a = params(1);
b = params(2);
A = params(3);
Omega = params(4);

% a=0.4;b=1.2;A=0.05;Omega=0.8;

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(1)^2*x(2) - (b+1)*x(1) + a + A*sin(Omega*t);
dx(2) = -x(1)^2*x(2) + b*x(1);

end
