function dx = F_hadley(t,x,params)
% Hadley Circulation

if nargin<3 || isempty(params)
	params = [0.25, 4, 8, 1]; % [a,b,F,G]
end

a = params(1);
b = params(2);
F = params(3);
G = params(4);

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = -x(2)^2 - x(3)^2 - a*(x(1) + F);
dx(2) = x(1)*x(2) - b*x(1)*x(3) - x(2) + G;
dx(3) = b*x(1)*x(2) + x(1)*x(3) - x(3);

end
