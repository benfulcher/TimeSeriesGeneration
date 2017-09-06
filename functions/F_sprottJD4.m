function dx = F_sprottJD4(t,x,params)
% First Jerk Equation
if nargin<3 || isempty(params)
	params = [-0.6, -2, 3];
end
% a=-0.6; b=-2; c=3;
a = params(1);
b = params(2);
c = params(3);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = a*x(3) + b*x(2) + c*x(1)^2 + x(1)*x(3) - 1;

end
