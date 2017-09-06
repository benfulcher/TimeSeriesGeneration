function dx = F_simpplcf(t,x,a)
% Simplest piecewise linear chaotic flow
if nargin<3 || isempty(a)
	a=0.6;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -a*x(3) - x(2) + abs(x(1)) - 1;

end
