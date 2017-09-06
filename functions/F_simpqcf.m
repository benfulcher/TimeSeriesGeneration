function dx = F_simpqcf(t,x,a)
% Simplest quadratic chaotic flow

if nargin<3 || isempty(a)
	a=2.017;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -a*x(3) + x(2)^2 - x(1);

end
