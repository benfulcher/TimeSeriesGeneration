function dx = F_diffnlorenz(t,x,R)
% A Diffusionless Lorenz Attractor
if nargin<3 || isempty(R)
	R=1;
end

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = -x(2)-x(1);
dx(2) = -x(1)*x(3);
dx(3) = x(1)*x(2) + R;

end
