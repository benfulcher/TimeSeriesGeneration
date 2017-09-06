function dx = F_dblscroll(t,x,a)
% Double Scroll

if nargin<3 || isempty(a)
	a=0.8;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -a*(x(3) + x(2) + x(1) - sign(x(1)));

end
