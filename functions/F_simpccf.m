function dx = F_simpccf(t,x,a)
% Simplest cubic chaotic flow
if nargin<3 || isempty(a)
	a = 2.028;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -a*x(3) + x(1)*x(2)^2 - x(1);

end
