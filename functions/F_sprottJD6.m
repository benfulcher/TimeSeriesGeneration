function dx = F_sprottJD6(t,x,params)
% First Jerk Equation
if nargin<3 || isempty(params)
	params = [-1, -1, 2, 2]; % [a,b,c,d]
end
% a=-1;b=-1;c=2;d=2;
a = params(1);
b = params(2);
c = params(3);
d = params(4);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = a*x(3) + b*x(2) + c*x(1)^2 + d*x(2)^2 + x(1)*x(3) - 1;

end
