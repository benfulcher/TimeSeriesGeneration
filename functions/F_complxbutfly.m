function dx = F_complxbutfly(t,x,a)
% A Complex Butterfly

if nargin < 3 || isempty(a)
	a = 0.55; % default
end

% Initialize:
dx = zeros(3,1);

% Evaluate:
dx(1) = a*(x(2) - x(3));
dx(2) = -x(3)*sign(x(1));
dx(3) = abs(x(1)) - 1;

end
