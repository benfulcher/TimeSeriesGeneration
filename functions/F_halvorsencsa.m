function dx = F_halvorsencsa(t,x,a)
% Halvorsen's cyclically symmetric attractor
if nargin<3 || isempty(a)
	a=1.27;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = -a*x(1) - 4*x(2) - 4*x(3) - x(2)^2;
dx(2) = -a*x(2) - 4*x(3) - 4*x(1) - x(3)^2;
dx(3) = -a*x(3) - 4*x(1) - 4*x(2) - x(1)^2;

end
