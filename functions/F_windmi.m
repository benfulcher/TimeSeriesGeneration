function dx = F_windmi(t,x,params)
% WINDMI attractor

if nargin<3 || isempty(params)
	params = [0.7, 2.5]; % [a,b]
end
a = params(1);
b = params(2);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -a*x(3) - x(2) + b - exp(x(1));

end
