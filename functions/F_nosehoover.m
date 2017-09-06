function dx = F_nosehoover(t,x,a)
% Nosé Hoover oscillator
if nargin<3 || isempty(a)
	a = 1;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = -x(1) + x(2)*x(3);
dx(3) = a-x(2)^2;

end
