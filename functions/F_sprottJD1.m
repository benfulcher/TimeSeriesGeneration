function dx = F_sprottJD1(t,x,params)
% First Jerk Equation
if nargin<3 || isempty(params)
	params = [-1.8, -2];
end
% a = -1.8; b = -2;
a = params(1);
b = params(2);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = a*x(3) + b*x(1) + x(1)*x(2) - 1;


end
