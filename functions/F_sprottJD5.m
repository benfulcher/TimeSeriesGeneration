function dx = F_sprottJD5(t,x,params)
% First Jerk Equation
if nargin<3 || isempty(params)
	params = [0.5, -1];
end
% a=0.5;b=-1;
a = params(1);
b = params(2);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = a*x(2) + b*x(1)^2 + x(2)^2 - x(1)*x(3);

end
