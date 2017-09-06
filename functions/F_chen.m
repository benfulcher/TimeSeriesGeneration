function dx = F_chen(t,x,params)
% Chen's System

if nargin<3 || isempty(params)
	params = [35, 3, 28];
end
a = params(1);
b = params(2);
c = params(3);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = a*(x(2) - x(1));
dx(2) = (c-a)*x(1) - x(1)*x(3) + c*x(2);
dx(3) = x(1)*x(2) - b*x(3);

end
