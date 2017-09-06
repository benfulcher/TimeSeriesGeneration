function dx = F_thomascsa(t,x,b)
% Thomas' cyclically symmetric attractor
if nargin<3 || isempty(b)
	b=0.18;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = -b*x(1) + sin(x(2));
dx(2) = -b*x(2) + sin(x(3));
dx(3) = -b*x(3) + sin(x(1));

end
